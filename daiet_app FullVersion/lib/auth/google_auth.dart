import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_util.dart';

final _googleSignIn = GoogleSignIn();

Future<User?> signInWithGoogle(BuildContext context) async {
  final signInFunc = () async {
    if (kIsWeb) {
      // Una vez que haya iniciado sesión, devuelve la credencial del usuario
      return await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
    }

    await signOutWithGoogle().catchError((_) => null);
    final auth = await (await _googleSignIn.signIn())?.authentication;
    if (auth == null) {
      return null;
    }
    final credential = GoogleAuthProvider.credential(
        idToken: auth.idToken, accessToken: auth.accessToken);
    return FirebaseAuth.instance.signInWithCredential(credential);
  };
  return signInOrCreateAccount(context, signInFunc, 'GOOGLE');
}

Future signOutWithGoogle() => _googleSignIn.signOut();
