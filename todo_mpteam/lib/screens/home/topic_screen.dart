import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:todo_mpteam/common/color_extension.dart';

class ChooseTopicScreen extends StatefulWidget {
  const ChooseTopicScreen({Key? key}) : super(key: key);

  @override
  State<ChooseTopicScreen> createState() => ChooseTopicScreenState();
}

class ChooseTopicScreenState extends State<ChooseTopicScreen> {
  List<Map<String, String>> dataArr = [
    {
      "image": "assets/img/topic1.png",
      "title": "Reduce Stress",
      "color": "8E97FD",
      "text_color": "FFECCC",
    },
    {
      "image": "assets/img/topic2.png",
      "title": "Improve Performance",
      "color": "FA6E5A",
      "text_color": "FEF9F3",
    },
    {
      "image": "assets/img/topic3.png",
      "title": "Increase Happiness",
      "color": "FEB18F",
      "text_color": "3F414E",
    },
    {
      "image": "assets/img/topic4.png",
      "title": "Reduce Anxiety",
      "color": "FFCF86",
      "text_color": "FEF9F3",
    },
    {
      "image": "assets/img/topic5.png",
      "title": "Personal Growth",
      "color": "6CB28E",
      "text_color": "FFECCC",
    },
    {
      "image": "assets/img/topic6.png",
      "title": "Better Sleep",
      "color": "4E5567",
      "text_color": "EBEAEC",
    },
    {
      "image": "assets/img/topic7.png",
      "title": "Better Sleep",
      "color": "D9A5B5",
      "text_color": "FEF9F3",
    },
    {
      "image": "assets/img/topic1.png",
      "title": "Better Sleep",
      "color": "D9A5B5",
      "text_color": "FEF9F3",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text("What brings you",
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                    Text(
                      "to Silent Moon?",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 15,),

                     Text(
                      "choose a topic to focus on:",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            child: MasonryGridView.count(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemCount: dataArr.length,
              itemBuilder: (context, index) {
                var height = index % 4 == 0 || index % 4 == 2
                    ? context.width * 0.55
                    : context.width * 0.45;
                var cObj = dataArr[index];

                return Container(
                  height: height,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: HexColor.fornHex(cObj['color']!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.asset(
                          cObj["image"]!,
                          width: double.maxFinite,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    cObj["title"]!,
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: HexColor.fornHex(
                                            cObj["text_color"]!),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
