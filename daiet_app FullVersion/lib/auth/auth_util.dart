import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_util.dart';

import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stream_transform/stream_transform.dart';
import 'firebase_user_provider.dart';

export 'anonymous_auth.dart';
export 'apple_auth.dart';
export 'email_auth.dart';
export 'google_auth.dart';
export 'jwt_token_auth.dart';

Future<User?> signInOrCreateAccount(
  BuildContext context,
  Future<UserCredential?> Function() signInFunc,
  String authProvider,
) async {
  try {
    final userCredential = await signInFunc();
    if (userCredential?.user != null) {
      await maybeCreateUser(userCredential!.user!);
    }
    return userCredential?.user;
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: ${e.message!}')),
    );
    return null;
  }
}

Future signOut() {
  return FirebaseAuth.instance.signOut();
}

Future deleteUser(BuildContext context) async {
  try {
    if (currentUser?.user == null) {
      print('Error: intento de eliminar usuario sin usuario registrado!');
      return;
    }
    await currentUser?.user?.delete();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'requiere inicio de sesión reciente') {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Demasiado tiempo desde el inicio de sesión más reciente. Vuelva a iniciar sesión antes de eliminar su cuenta.')),
      );
    }
  }
}

Future resetPassword(
    {required String email, required BuildContext context}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: ${e.message!}')),
    );
    return null;
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(
            'Correo electrónico de restablecimiento de contraseña enviado')),
  );
}

Future sendEmailVerification() async =>
    currentUser?.user?.sendEmailVerification();

String get currentUserEmail =>
    currentUserDocument?.email ?? currentUser?.user?.email ?? '';

String get currentUserUid => currentUser?.user?.uid ?? '';

String get currentUserDisplayName =>
    currentUserDocument?.displayName ?? currentUser?.user?.displayName ?? '';

String get currentUserPhoto =>
    currentUserDocument?.photoUrl ?? currentUser?.user?.photoURL ?? '';

String get currentPhoneNumber =>
    currentUserDocument?.phoneNumber ?? currentUser?.user?.phoneNumber ?? '';

String get currentJwtToken => _currentJwtToken ?? '';

bool get currentUserEmailVerified {
  // Recarga al usuario al verificar para obtener la máxima actualización
  // estado verificado del correo electrónico.
  if (currentUser?.user != null && !currentUser!.user!.emailVerified) {
    currentUser!.user!
        .reload()
        .then((_) => currentUser!.user = FirebaseAuth.instance.currentUser);
  }
  return currentUser?.user?.emailVerified ?? false;
}

/// Crea un Stream que escucha el token JWT del usuario actual, desde Firebase
/// genera un nuevo token cada hora.
String? _currentJwtToken;
final jwtTokenStream = FirebaseAuth.instance
    .idTokenChanges()
    .map((user) async => _currentJwtToken = await user?.getIdToken())
    .asBroadcastStream();

//Se establece cuando se utiliza la verificación telefónica (después de proporcionar el número de teléfono).
String? _phoneAuthVerificationCode;
// Se establece cuando utiliza el inicio de sesión del teléfono en modo web (se ignorará de lo contrario).
ConfirmationResult? _webPhoneAuthConfirmationResult;

Future beginPhoneAuth({
  required BuildContext context,
  required String phoneNumber,
  required VoidCallback onCodeSent,
}) async {
  if (kIsWeb) {
    _webPhoneAuthConfirmationResult =
        await FirebaseAuth.instance.signInWithPhoneNumber(phoneNumber);
    onCodeSent();
    return;
  }
  final completer = Completer<bool>();
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    timeout: Duration(seconds: 5),
    verificationCompleted: (phoneAuthCredential) async {
      await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
    },
    verificationFailed: (e) {
      completer.complete(false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: ${e.message!}'),
      ));
    },
    codeSent: (verificationId, _) {
      _phoneAuthVerificationCode = verificationId;
      completer.complete(true);
      onCodeSent();
    },
    codeAutoRetrievalTimeout: (_) {},
  );

  return completer.future;
}

Future verifySmsCode({
  required BuildContext context,
  required String smsCode,
}) async {
  if (kIsWeb) {
    return signInOrCreateAccount(
      context,
      () => _webPhoneAuthConfirmationResult!.confirm(smsCode),
      'PHONE',
    );
  } else {
    final authCredential = PhoneAuthProvider.credential(
        verificationId: _phoneAuthVerificationCode!, smsCode: smsCode);
    return signInOrCreateAccount(
      context,
      () => FirebaseAuth.instance.signInWithCredential(authCredential),
      'PHONE',
    );
  }
}

DocumentReference? get currentUserReference => currentUser?.user != null
    ? UsersRecord.collection.doc(currentUser!.user!.uid)
    : null;

UsersRecord? currentUserDocument;
final authenticatedUserStream = FirebaseAuth.instance
    .authStateChanges()
    .map<String>((user) => user?.uid ?? '')
    .switchMap(
      (uid) => uid.isEmpty
          ? Stream.value(null)
          : UsersRecord.getDocument(UsersRecord.collection.doc(uid))
              .handleError((_) {}),
    )
    .map((user) => currentUserDocument = user)
    .asBroadcastStream();

class AuthUserStreamWidget extends StatelessWidget {
  const AuthUserStreamWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: authenticatedUserStream,
        builder: (context, _) => child,
      );
}
