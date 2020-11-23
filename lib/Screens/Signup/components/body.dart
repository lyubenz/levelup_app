import 'package:flutter/material.dart';

import 'package:levelupapp/Screens/Login/login_screen.dart';
import 'package:levelupapp/Screens/Signup/components/background.dart';
import 'package:levelupapp/Components/already_have_an_account_acheck.dart';
import 'package:levelupapp/Components/rounded_button.dart';
//import 'package:levelupapp/Components/rounded_input_field.dart';
//import 'package:levelupapp/Components/rounded_password_field.dart';

class Body extends StatefulWidget {
  Body({Key key, }) : super(key: key);

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Select Your Experience",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: size.height * 0.04),
            RoundedButton(
              text: "Organization",
              press: () {},
            ),
            RoundedButton(
              text: "Participant",
              press: () {},
            ),
            RoundedButton(
              text: "Guest",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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
