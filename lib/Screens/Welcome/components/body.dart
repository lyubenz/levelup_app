import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:levelupapp/Screens/Login/login_screen.dart';
import 'package:levelupapp/Screens/Signup/signup_screen.dart';
import 'package:levelupapp/Screens/Welcome/components/background.dart';
import 'package:levelupapp/Components/rounded_button.dart';
import 'package:levelupapp/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/logo-lu.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0),
            Text(
              "Welcome to",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              "The Level Up! Project",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.1),
            RoundedButton(
              text: "Get Started",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Log In",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
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
