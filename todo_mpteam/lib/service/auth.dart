
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> registerNewUser(String email, String password) async {
    String response = "Something is wrong";
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      response = "Success";
    } catch (e) {}
    return response;
  }

  Future<String> loginUser(String email, String password) async {
    String response = "Something is wrong";
    try{
    await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      response = "Login Success";
   

    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found'){
        response = "unregistered email";

      }else if (e.code == 'wrong-password'){
        response = "wrong password";
      }
    }
    return response;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
