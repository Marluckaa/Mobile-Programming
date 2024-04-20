import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_mpteam/common/color_extension.dart';
import 'package:todo_mpteam/common_widget/circle_button.dart';
import 'package:todo_mpteam/common_widget/round_button.dart';
import 'package:todo_mpteam/screens/home/home_screen.dart';
import 'package:todo_mpteam/screens/main_tabveiw/main_tabview_screen.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  List dayArr = [
    {"name": "SU", "is_select": false},
    {"name": "M", "is_select": false},
    {"name": "T", "is_select": false},
    {"name": "W", "is_select": false},
    {"name": "TH", "is_select": false},
    {"name": "F", "is_select": false},
    {"name": "S", "is_select": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              constraints: BoxConstraints(minHeight: context.height - 180),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text("What time would you\nlike to meditate?",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Any time you can choose but We recommend\nfirst thing in th morning",
                    style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: const Color(0xffF5F5F9),
                        borderRadius: BorderRadius.circular(20)),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      onDateTimeChanged: (DateTime newDate) {},
                      use24hFormat: false,
                      minuteInterval: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Text("What day would you\nlike to meditate?",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Everyday is best, but we recommend picking\nat least five.",
                    style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: dayArr.map((dObj) {
                      return CircleButton(
                          title: dObj["name"],
                          isSelect: dObj["is_select"],
                          onPressed: () {
                            setState(() {
                              dayArr[dayArr.indexOf(dObj)]["is_select"] =
                                  !(dObj["is_select"] as bool? ?? false);
                            });
                          });
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
            RoundButton(
                title: "SAVE",
                onPressed: () {
                  context.push(const MainTabViewScreen());
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      context.push(const MainTabViewScreen());
                    },
                    child: Text("No Thanks",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )))
              ],
            )
          ],
        )),
      ),
    );
  }
}
