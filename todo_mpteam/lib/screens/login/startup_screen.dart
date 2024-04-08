import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_mpteam/common/color_extension.dart';
import 'package:todo_mpteam/common_widget/round_button.dart';
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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "img/startup_top.png",
                  width: double.maxFinite,
                  fit: BoxFit.fitHeight,
                ),
                const SizedBox(height:15),
                Text(
                  "We are what we do",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
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
                RoundButton(title: "SIGN UP", onPressed: () {
                  context.push(const SignUpScreen());
                }),
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
                        context.push(const LoginScreen());
                      },
                      child: Text(
                        "LOGIN",
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
    );
  }
}
