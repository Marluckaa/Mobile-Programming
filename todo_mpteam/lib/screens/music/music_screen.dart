import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_mpteam/common/color_extension.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
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
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text(
          "Music",
          style: TextStyle(
              color: TColor.sleepText,
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.08),
        itemBuilder: (context, index) {
          var c0bj = listArr[index];
          return Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  c0bj["image"],
                  width: double.maxFinite,
                  height: context.width * 0.3,
                  fit: BoxFit.cover
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                c0bj["title"],maxLines: 1,style: TextStyle(
                  color: TColor.sleepText,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
                ),
              ),
                SizedBox(
                height: 4,
              ),
              Text(
                c0bj["subtitle"],maxLines: 1,style: TextStyle(
                  color: TColor.sleepText,
                  fontSize: 12,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
