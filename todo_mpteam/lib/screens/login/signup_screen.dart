import 'package:todo_mpteam/common/color_extension.dart';
import 'package:todo_mpteam/screens/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:todo_mpteam/service/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "", _response = "";
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  Future<void> registration() async {
    if (password != null && namecontroller.text != "" && mailcontroller.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color(0xff8E97FD),
          content: Text(
            "Registered Successfully",
            style: TextStyle(fontSize: 20.0),
          ),
        ));
        Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color(0xff8E97FD),
            content: Text(
              "Password Provided is too Weak",
              style: TextStyle(fontSize: 18.0),
            ),
          ));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color(0xff8E97FD),
            content: Text(
              "Account Already exists",
              style: TextStyle(fontSize: 18.0),
            ),
          ));
        }
      }
    }
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
                ),
              ),
              Text(
                "Create your account",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFedf0f8),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Name';
                            }
                            return null;
                          },
                          controller: namecontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Name",
                              hintStyle: TextStyle(color: Color(0xFFb2b7bf), fontSize: 18.0)),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFedf0f8),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            }
                            return null;
                          },
                          controller: mailcontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(color: Color(0xFFb2b7bf), fontSize: 18.0)),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFedf0f8),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Color(0xFFb2b7bf), fontSize: 18.0)),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = mailcontroller.text;
                              name = namecontroller.text;
                              password = passwordcontroller.text;
                            });
                            await registration();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 195.0),
                           backgroundColor: Color(0xFF8E97FD),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ALREADY HAVE AN ACCOUNT?",
                    style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
                    },
                    child: Text(
                      "LOG IN",
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
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
