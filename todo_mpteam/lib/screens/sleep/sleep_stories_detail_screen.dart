import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_mpteam/common/color_extension.dart';
import 'package:todo_mpteam/common_widget/round_button.dart';

class SleepStoriesDetailScreen extends StatefulWidget {
  const SleepStoriesDetailScreen({super.key});

  @override
  State<SleepStoriesDetailScreen> createState() =>
      _SleepStoriesDetailScreenState();
}

class _SleepStoriesDetailScreenState extends State<SleepStoriesDetailScreen> {
  List listArr = [
    {
      "image": "img/n1.png",
      "title": "Moon Clouds",
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.sleep,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                backgroundColor: TColor.sleep,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: Image.asset(
                      "img/bwhite.png",
                      width: 55,
                      height: 55,
                    ),
                  ),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: Image.asset(
                      "img/heart.png",
                      width: 45,
                      height: 45,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Image.asset(
                        "img/save.png",
                        width: 45,
                        height: 45,
                      ),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    child: Image.asset(
                      "img/slpcloud.png",
                      width: context.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                expandedHeight: context.width * 0.6,
              )
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Night Island",
                        style: TextStyle(
                            color: TColor.sleepText,
                            fontSize: 34,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "45 MIN . SLEEP MUSIC",
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Ease the mind into a restful night’s sleep with these deep, amblent tones.",
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "img/Vector.png",
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "24.234 Favorits",
                              style: TextStyle(
                                  color: TColor.secondaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Image.asset(
                            "img/hdp.png",
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "34.234 Lestening",
                              style: TextStyle(
                                  color: TColor.secondaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            
                          ),
                          
                        ],
                      ),
                      const SizedBox(
                         height: 25,
                        ),
                        Divider(
                          height: 2,
                          color: TColor.sleepText.withOpacity(0.3),
                        ),
                        const SizedBox(
                         height: 25,
                        ),
                         Text(
                              "Related",
                              style: TextStyle(
                                  color: TColor.sleepText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                    ],
                  ),
                ),


              GridView.builder
              
              (
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

               crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.08
              ), itemBuilder: (context , index){
                 var c0bj = listArr[index];
                return GestureDetector(
                  onTap: (){
                    
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
              itemCount: listArr.length,),
              const  SizedBox(
                        height: 15,
                      ),
                      RoundButton(title: "Play", onPressed: (){}),
               const  SizedBox(
                        height: 30,
                      ),

              ],
            ),
          )),
    );
  }
}
