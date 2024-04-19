import 'package:flutter/material.dart';
import 'package:todo_mpteam/common_widget/tab_button.dart';
import 'package:todo_mpteam/screens/home/home_screen.dart';

class MainTabViewScreen extends StatefulWidget {
  const MainTabViewScreen({super.key});
  

  @override
  State<MainTabViewScreen> createState() => _MainTabViewScreenState();
  
}

class _MainTabViewScreenState extends State<MainTabViewScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;
@override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: TabBarView(controller: controller, children: [
        const HomeScreen(),
        Container(),
        Container(
          color: Colors.yellow,
        ),
        Container(),
        Container(
          color: Colors.red,
        )
      ]),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 15, bottom: 8),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -4))
        ]),
        child: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabButton(
                title: "Home",
                icon: "img/Home.png",
                isSelect: selectTab == 0,
                onPressed: () {
                  changeTab(0);
                }),
            TabButton(
                title: "Sleep",
                icon: "img/Sleep.png",
                isSelect: selectTab == 1,
                onPressed: () {
                  changeTab(1);
                }),
                 TabButton(
                title: "Meditate",
                icon: "img/meditate.png",
                isSelect: selectTab == 2,
                onPressed: () {
                  changeTab(2);
                }),
                
                 TabButton(
                title: "Music",
                icon: "img/music.png",
                isSelect: selectTab == 3,
                onPressed: () {
                  changeTab(3);
                }),
                 TabButton(
                title: "Profile",
                icon: "img/user.png",
                isSelect: selectTab == 4,
                onPressed: () {
                  changeTab(4);
                })
          ],
        )),
      ),
    );
  }

  void changeTab(int index) {
    selectTab = index;
    controller?.animateTo(index);
    setState(() {});
  }
}
