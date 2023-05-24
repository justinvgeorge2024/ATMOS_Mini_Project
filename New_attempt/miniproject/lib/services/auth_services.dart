import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static final _firebaseAuth = FirebaseAuth.instance;

  static Future<String> singup(
      {required String email, required String password}) async {
    String res = "something went wrong";
    try {
      // ignore: unused_local_variable
      UserCredential cred = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      res = "Sucsess";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  static Future<String> login(
      {required String email, required String password}) async {
    String res = "something went wrong";
    try {
      // ignore: unused_local_variable
      UserCredential cred = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      res = "Sucsess";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
