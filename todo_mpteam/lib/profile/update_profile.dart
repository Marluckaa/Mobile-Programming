
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:todo_mpteam/common/color_extension.dart';
import 'package:todo_mpteam/common/text_string.dart';
import 'package:todo_mpteam/profile/profile_screen.dart';
import 'package:todo_mpteam/service/user_model.dart';
import 'package:provider/provider.dart';
import 'package:todo_mpteam/service/utils.dart';
import '../service/user_provider.dart';

class UpdateProfileScreen extends StatelessWidget {
  // Uint8List? _image;
  // void selectImage() async{
  //   Uint8List img = await pickImage(ImageSource.gallery);

  // }
  TextEditingController namecontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  DatabaseMethods dbm = new DatabaseMethods();

  final _formkey = GlobalKey<FormState>();
  static const double tDefaultSize = 20.0;
  Future<void> getUserByEmail(String userEmail) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('email', isEqualTo: userEmail)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // User with the specified email found
        var userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
        if (userData != null) {
          userData.forEach((key, value) {
            if (key == 'email') {
              mailcontroller.text = value;
            } else if (key == 'phoneNo') {
              phonecontroller.text = value;
            } else if (key == 'fullName') {
              namecontroller.text = value;
            } else if (key == 'weight') {
              weightcontroller.text = value;
            } else if (key == 'height') {
              heightcontroller.text = value;
            }

            print('$key: $value');
          });
        } else {
          print('User data is null');
        }
        print('User data: $userData');
      } else {
        // No user found with the specified email
        print('User with email $userEmail not found');
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    String? userEmail = Provider.of<UserProvider>(context).userEmail;
    // print("Email:"+userEmail.toString());
    getUserByEmail(userEmail.toString());
    //final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileScreen()));
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(tEditProfile,
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              // -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:
                            const Image(image: AssetImage("img/profile.jpg"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: TColor.primary),
                      child: const Icon(LineAwesomeIcons.camera,
                          color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 30.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFFedf0f8),
                          borderRadius: BorderRadius.circular(30)),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Овог нэрээ оруулна уу!';
                          }
                          return null;
                        },
                        controller: namecontroller,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Овог нэр",
                            hintStyle: TextStyle(
                                color: Color(0xFFb2b7bf), fontSize: 18.0)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 30.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFedf0f8),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        controller: heightcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Өндөрөө оруулна уу!";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Өндөр",
                          hintStyle: TextStyle(
                            color: Color(0xFFb2b7bf),
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 30.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFedf0f8),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        controller: weightcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Жингээ оруулна уу!';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Жин",
                          hintStyle: TextStyle(
                            color: Color(0xFFb2b7bf),
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 30.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFFedf0f8),
                          borderRadius: BorderRadius.circular(30)),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Имэйлээ оруулна уу!';
                          }
                          return null;
                        },
                        controller: mailcontroller,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Имэйл",
                            hintStyle: TextStyle(
                                color: Color(0xFFb2b7bf), fontSize: 18.0)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 30.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFFedf0f8),
                          borderRadius: BorderRadius.circular(30)),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Утасны дугаараа оруулна уу!';
                          }
                          return null;
                        },
                        controller: phonecontroller,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Утасны дугаар",
                            hintStyle: TextStyle(
                                color: Color(0xFFb2b7bf), fontSize: 18.0)),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Map<String, dynamic> data = {
                            'fullName': namecontroller.text,
                            'email': userEmail,
                            'phoneNo': phonecontroller.text,
                            'height': heightcontroller.text,
                            'weight': weightcontroller.text,
                          };

                          print("clicked");
                          FirebaseFirestore.instance
                              .collection('Users')
                              .add(data)
                              .then((_) {
                            // Show SnackBar when editing is successful
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Profile edited successfully'),
                              ),
                            );
                          }).catchError((error) {
                            // Handle errors if any
                            print('Error editing profile: $error');
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: TColor.primary,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(
                          tEditProfile,
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // -- Created Date and Delete Button
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: tJoined,
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: tJoinedAt,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13))
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        // ElevatedButton(
                        //   onPressed: () async {
                        //     String? userEmail =
                        //         Provider.of<UserProvider>(context).userEmail;
                        //     DocumentReference userDocRef = FirebaseFirestore
                        //         .instance
                        //         .collection('Users')
                        //         .doc(userEmail);
                        //     try{
                        //       await UserDocumentReference.delete();
                        //       print('Document deleted successfully');
                        //     } catch(error){
                        //       print('Error deleting document: $error');
                        //     }
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //       backgroundColor:
                        //           Colors.redAccent.withOpacity(0.1),
                        //       elevation: 0,
                        //       foregroundColor: Colors.red,
                        //       shape: const StadiumBorder(),
                        //       side: BorderSide.none),
                        //   child: const Text(tDelete),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
