
import 'package:flutter/material.dart';

import 'sign_up.dart';

class logInScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Log In",
              style: TextStyle(
                backgroundColor: Color.fromARGB(255, 131, 177, 255),
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 23,
              ),
            ),
            const Text(
              "Welcome to Ghibli",
              style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2,
                fontSize: 18,
              ),
            ),
            Image.network(
              "https://upload.wikimedia.org/wikipedia/en/thumb/c/ca/Studio_Ghibli_logo.svg/1200px-Studio_Ghibli_logo.svg.png",
              height: 200,
              width: 200,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: const Text(
                "Email",
                style: TextStyle(
                    fontFamily: "Nunito Sans", fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Color.fromARGB(255, 206, 205, 255),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                labelText: "Enter your Email address",
                labelStyle: TextStyle(
                  fontFamily: "NUnito Sans",
                  fontSize: 14,
                  letterSpacing: 0.1,
                ),
                prefixIcon: Icon(
                  Icons.email,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: const Text(
                "Password",
                style: TextStyle(
                    fontFamily: "Nunito Sans", fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Color.fromARGB(255, 206, 205, 255),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                labelText: "Password",
                labelStyle: TextStyle(
                  fontFamily: "NUnito Sans",
                  fontSize: 14,
                  letterSpacing: 0.1,
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  size: 20,
                ),
                suffixIcon: Icon(Icons.visibility),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: (){
                // inkwell mouse n zurg oorchilno button drhad 
              },
              child: Container(
                width: 320,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 175, 137, 237),
                        Color.fromARGB(255, 219, 125, 125)
                      ],
                    )),
                child: Center(
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: (){
                    // end bottom darhad hiigdeh vildel bichgdne
                    Navigator.push(context, MaterialPageRoute(builder:(context){
                      return signUpScreen();
                    }

                    ));
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
    
  }

}