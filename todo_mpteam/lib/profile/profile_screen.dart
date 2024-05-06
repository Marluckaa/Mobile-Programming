import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:todo_mpteam/common/color_extension.dart';
import 'package:todo_mpteam/common/text_string.dart';
import 'package:todo_mpteam/profile/update_profile.dart';
import 'package:todo_mpteam/screens/login/startup_screen.dart';
import 'package:todo_mpteam/screens/main_tabveiw/main_tabview_screen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainTabViewScreen()),
            );
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          tProfile,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
               Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MainTabViewScreen()));
            },
            icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage("img/profile.jpg")),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: TColor.primary,
                        ),
                        child: const Icon(LineAwesomeIcons.alternate_pencil,
                            size: 20.0, color: Colors.black)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Maralgua",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateProfileScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColor.primary,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(tEditProfile,
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: "Settings",
                icon: LineAwesomeIcons.cog,
                onPress: () {},
                textColor: TColor.primaryText,
              ),
              ProfileMenuWidget(
                title: "User Management",
                icon: LineAwesomeIcons.user_check,
                onPress: () {},
                textColor: TColor.primaryText,
              ),
              const Divider(),
              ProfileMenuWidget(
                title: "Log Out",
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StartUpScreen()),
                    );

                },
                
              ),
              // ProfileMenuWidget(
              //   title: "Log Out",
              //   icon: LineAwesomeIcons.alternate_sign_out,
              //   textColor: Colors.red,
              //   endIcon: false,
              //   onPress: () {
              //     showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           title: Text("LOGOUT"),
              //           content: Text("Are you sure you want to Logout?"),
              //           actions: [
              //             ElevatedButton(
              //               onPressed: () {
                              
              //                 Navigator.pop(context); // Close the dialog
              //               },
              //               style: ElevatedButton.styleFrom(
              //                 backgroundColor: Colors.redAccent,
              //                 side: BorderSide.none,
              //               ),
              //               child: Text("Yes"),
              //             ),
              //             OutlinedButton(
              //               onPressed: () {
              //                 Navigator.pop(context); // Close the dialog
              //               },
              //               child: Text("No"),
              //             ),
              //           ],
              //         );
              //       },
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.tealAccent.withOpacity(0.1),
        ),
        child: Icon(icon, color: textColor), // Use provided textColor
      ),
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodyLarge?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(LineAwesomeIcons.angle_right,
                  size: 18.0, color: Colors.grey))
          : null,
    );
  }
}
