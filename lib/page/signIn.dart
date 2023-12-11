import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medtrack/page/UserHome.dart';
import 'package:medtrack/page/signUp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class signIn extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<Map<String, dynamic>> fetchUserData() async {
 final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

 if (response.statusCode == 200) {
   List<dynamic> users = jsonDecode(response.body);
   return users.firstWhere((user) => user['email'] == emailController.text);
 } else {
   throw Exception('Failed to load user data');
 }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 30.0, top: 70),
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
                  left: 30.0,
                  top: 10.0,
                  right: 30.0), // Adjust margins as needed
              child: TextField(
                controller: emailController,
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
                  left: 30.0,
                  top: 10.0,
                  right: 30.0), // Adjust margins as needed
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
                onPressed: () async {
                  try {
                    Map<String, dynamic> user = await fetchUserData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserHomeScreen(user: user)),
                    );
                  } catch (e) {
                    print('Failed to sign in: $e');
                  }
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
            Container(
              margin: EdgeInsets.only(top: 50), // Add top margin as needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width /
                        3, // Match half of the screen width
                    height: 1, // Adjust the height (thickness) of the line
                    color: Colors.grey, // Change the line color
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 10), // Adjust margins as needed
                    child: Text(
                      "Or",
                      style: TextStyle(
                        fontSize: 18, // Adjust the font size
                        fontWeight: FontWeight.bold, // Adjust the font weight
                        color: Colors.black, // Change the text color
                      ),
                      textAlign: TextAlign.center, // Center the text
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width /
                        3, // Match half of the screen width
                    height: 1, // Adjust the height (thickness) of the line
                    color: Colors.grey, // Change the line color
                  ),
                ],
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            signUp()), // Navigate to SignUp.dart
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 70.0, bottom: 30.0),
                  child: Text(
                    "Don’t have an account? Sign Up.",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
              ),
            )

            // Add more child widgets here as needed
          ],
        ),
      ),
    );
  }
}
