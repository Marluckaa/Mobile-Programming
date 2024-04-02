import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_mpteam/common/color_extension.dart';
import 'package:todo_mpteam/common_widget/round_button.dart';

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({super.key});

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("startup_top.png",
                       width: double.maxFinite,
                       fit: BoxFit.fitHeight
                       ),
          const Spacer(),

          const Spacer(),
          RoundButton(title: "SIGN UP", onPressed: (){

      }),
          Row(
            children: [
              Text("ALREADY HAVE AN ACCOUNT?",
              style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              ),
              TextButton(onPressed:(){

              },
              child: Text("LOGIN",
              style: TextStyle(
                color: TColor.primary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              ),)

            ],
          ),

          const Spacer(),
        ]
      ),
    );
  }
}
