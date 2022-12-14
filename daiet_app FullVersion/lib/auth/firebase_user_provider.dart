import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class DaietAppFirebaseUser {
  DaietAppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

DaietAppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DaietAppFirebaseUser> daietAppFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<DaietAppFirebaseUser>(
      (user) {
        currentUser = DaietAppFirebaseUser(user);
        return currentUser!;
      },
    );
