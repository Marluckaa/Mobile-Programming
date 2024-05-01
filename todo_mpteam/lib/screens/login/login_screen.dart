// ignore_for_file: use_build_context_synchronously
import 'package:todo_mpteam/common/color_extension.dart';
import 'package:todo_mpteam/screens/home/welcome_screen.dart';
import 'package:todo_mpteam/screens/login/forgot_password.dart';
import 'package:todo_mpteam/screens/login/signup_screen.dart';
import 'package:todo_mpteam/screens/login/startup_screen.dart';
//import 'package:todo_mpteam/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_mpteam/service/auth.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "", password = "", _response="";

  TextEditingController mailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();
final AuthController _authController =  AuthController();
 loginUser() async {
   _response = await _authController.loginUser(email, password);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "img/login1.jpg",
                       height: 350,
                      width: 400,
                  )),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFedf0f8),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter E-mail';
                            }
                            return null;
                          },
                          controller: mailcontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Color(0xFFb2b7bf), fontSize: 18.0)),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFedf0f8),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          controller: passwordcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Color(0xFFb2b7bf), fontSize: 18.0)),
                     obscureText: true,   ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: (){
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              email= mailcontroller.text;
                              password=passwordcontroller.text;
                            });
                          }
                          loginUser();
                           if(_response == "Login Success"){
                           
                      Navigator.push(context,
                     MaterialPageRoute(builder: (context) =>WelcomeScreen()));
                    
                    }
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                vertical: 13.0, horizontal: 30.0),
                            decoration: BoxDecoration(
                                color: const Color(0xff8E97FD),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                                child: Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500),
                            ))),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                 height: 20.0,
               ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPassword()));
                },
                child: Text("Forgot Password?",
                    style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                  "OR LOGIN WITH EMAIL",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "img/google.png",
                    height: 45,
                    width: 45,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Image.asset(
                    "img/apple1.png",
                    height: 45,
                    width: 45,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // GestureDetector(
                  //   onTap: (){
                  //     AuthMethods().signInWithGoogle(context);
                  //   },
                  //   child: Image.asset(
                  //     "images/google.png",
                  //     height: 45,
                  //     width: 45,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                
                ],
              ),
              // SizedBox(
              //   height: 30.0,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                        "DON'T HAVE AN ACCOUNT?",
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: TColor.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}