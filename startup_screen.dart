import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_mpteam/common/color_extension.dart';
import 'package:todo_mpteam/common_widget/round_button.dart';
import 'package:todo_mpteam/screens/home/reminders_screen.dart';
import 'package:todo_mpteam/screens/home/welcome_screen.dart';
import 'package:todo_mpteam/screens/login/login_screen.dart';
import 'package:todo_mpteam/screens/login/signup_screen.dart';

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({Key? key}) : super(key: key);

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "img/startup_top.png",
                    width: double.maxFinite,
                    fit: BoxFit.fitHeight,
                  ),
                  Text(
                    "We are what we do",
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Маш олон хэрэглэгчид нэгэн зэрэг\nбясалгал хийх газар",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  RoundButton(
                    title: "SIGN UP",
                    onPressed: () {
                      context.push(const SignUpScreen());
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) =>  SignUpScreen(),
                      //     ),
                      //   );
                    },
                  ),
                  const SizedBox(height: 15),
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
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
