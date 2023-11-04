import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class signIn extends StatelessWidget {
  const signIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: 30.0),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/Monotone health plus.svg',
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20.0, left: 30.0),
            child: Text(
              "Sign In",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Sign in and get your health personalized with our AI Technology.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.0, top: 30.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Email Address",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          // Add the email input field below
          Container(
            margin: EdgeInsets.only(
                left: 30.0, top: 10.0, right: 30.0), // Adjust margins as needed
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter your email",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.0, top: 20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Password",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          // Add the password input field below
          Container(
            margin: EdgeInsets.only(
                left: 30.0, top: 10.0, right: 30.0), // Adjust margins as needed
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter your password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
          ),
          // "Sign In" button
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
            child: ElevatedButton(
              onPressed: () {
                // Add sign-in logic here
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20), // Adjust padding as needed
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add spacing between the SVG and the button text
                  Text(
                    "Sign In ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(width: 10),
                  SvgPicture.asset(
                    'assets/icons/22  user.svg', // Replace with your SVG path
                    width: 30, // Adjust the width as needed
                    height: 30, // Adjust the height as needed
                  ),
                ],
              ),
            ),
          ),
          // Add more child widgets here as needed
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: [
        Container(
          alignment: Alignment.center,
          height: 100,
          margin: EdgeInsets.only(top: 10),
        ),
      ],
    );
  }
}
