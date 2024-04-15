import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUpController {
  final FirebaseAuth _auth = FirebaseAuth.instance; 


  Future<String> registerNewUser(
    String email, String password
  ) async{
    String response = "Something is wrong";
    try{
      await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );
       response = "Registered Successfully! Please LogIn";
    } catch(e) {

    }
    return response;
  }
}