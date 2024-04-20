import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_mpteam/common/color_extension.dart';
import 'package:todo_mpteam/screens/sleep/sleep_stories_detail_screen.dart';

class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  int selectIndex = 0;
  List catArr = [
    {"icon": "img/all.png", "title": "All"},
    {"icon": "img/my.png", "title": "My"},
    {"icon": "img/anxious.png", "title": "Anxious"},
    {"icon": "img/sleep.png", "title": "Sleep"},
    {"icon": "img/kids.png", "title": "Kids"},
  ];
  List listArr = [
    {
      "image": "img/n1.png",
      "title": "Night Island",
      "subtitle": "45 MIN . SLEEP MUSIC"
    },
    {
      "image": "img/n2.png",
      "title": "Sweet Sleep",
      "subtitle": "45 MIN . SLEEP MUSIC"
    },
    {
      "image": "img/n3.png",
      "title": "Good Night",
      "subtitle": "45 MIN . SLEEP MUSIC"
    },
    {
      "image": "img/n4.png",
      "title": "Moon Clouds",
      "subtitle": "45 MIN . SLEEP MUSIC"
    },
    {
      "image": "img/n2.png",
      "title": "Night Island",
      "subtitle": "45 MIN . SLEEP MUSIC"
    },
    {
      "image": "img/n1.png",
      "title": "Sweet Sleep",
      "subtitle": "45 MIN . SLEEP MUSIC"
    },
    {
      "image": "img/n4.png",
      "title": "Good Night",
      "subtitle": "45 MIN . SLEEP MUSIC"
    },
    {
      "image": "img/n3.png",
      "title": "Moon Clouds",
      "subtitle": "45 MIN . SLEEP MUSIC"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.sleep,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  "img/sb.png",
                  width: double.maxFinite,
                  fit: BoxFit.fitWidth,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sleep Stories",
                          maxLines: 1,
                          style: TextStyle(
                            color: TColor.sleepText,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Soothing bedtime stories to help you fall into a deep and natural sleep",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                          color: TColor.sleepText,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var cObj = catArr[index];
                            return GestureDetector(
                              onTap: () {
                                selectIndex = index;
                                setState(() {});
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: selectIndex == index
                                          ? TColor.primary
                                          : const Color(0xff586894),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      cObj['icon'],
                                      width: 25,
                                      height: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    cObj['title'],
                                    style: TextStyle(
                                        color: selectIndex == index
                                            ? TColor.primary
                                            : TColor.secondaryText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 20,
                              ),
                          itemCount: catArr.length),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: const Color(0xffF1DDCF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "img/sleepB.png",
                            width: double.maxFinite,
                            fit: BoxFit.fitWidth,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 60,
                                      ),
                                      const Text(
                                        "The Ocean Moon",
                                        style: TextStyle(
                                            color: Color(0xffFFE7BF),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Non-stop 8- hour mixes of our most popular sleep audio",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: TColor.tertiary,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: TColor.tertiary,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 15),
                                          child: Text("START",
                                              style: TextStyle(
                                                color: TColor.primaryText,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listArr.length,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.08),
              itemBuilder: (context, index) {
                var c0bj = listArr[index];
                return GestureDetector(
                  onTap: (){
                    context.push( const SleepStoriesDetailScreen() );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(c0bj["image"],
                            width: double.maxFinite,
                            height: context.width * 0.3,
                            fit: BoxFit.cover),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        c0bj["title"],
                        maxLines: 1,
                        style: TextStyle(
                            color: TColor.sleepText,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        c0bj["subtitle"],
                        maxLines: 1,
                        style: TextStyle(
                          color: TColor.sleepText,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
