import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  final FirebaseAuth _authentication = FirebaseAuth.instance;
  String? errorMassage;

  Future signUpManualy(String email, String password) async {
    try {
      final signUpManual = await _authentication.createUserWithEmailAndPassword(
          email: email, password: password);

      return signUpManual;
    } on FirebaseAuthException catch (e) {
      // print(e.code);
      if (e.code == "email-already-in-use") {
        return "Email already in use";
      }
    }
  }

  Future signInManualy(String email, String password) async {
    if (_authentication.currentUser == null) {
      try {
        final signInManual = await _authentication.signInWithEmailAndPassword(
            email: email, password: password);

        return signInManual;
      } on FirebaseAuthException catch (e) {
        return null;
      }
    }
  }

  Future signOut() async {
    try {
      final signOut = await FirebaseAuth.instance.signOut();

      return signOut;
    } catch (e) {
      rethrow;
    }
  }
}
