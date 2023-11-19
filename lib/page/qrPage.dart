import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

class qrPage extends StatelessWidget {
  const qrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 30),
                child: GestureDetector(
                  onTap: () {
                    // Add your functionality for the clickable icon
                    print('Clickable icon tapped!');
                  },
                  child: Icon(Icons.arrow_back_ios_rounded, size: 40),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30, left: 30, top: 50),
                width: 200, // Adjust the width as needed
                height: 17, // Adjust the height as needed
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.circular(10) // Adjust the color as needed
                    ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30.0, top: 50),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/Monotone health plus.svg',
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ]),
            SizedBox(
                height:
                    20), // Add spacing between the three containers and the text
            Text(
              "QR CODE",
              style: TextStyle(
                fontSize: 30, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 30),
                child: QrImageView(
                  data: 'This is a simple QR code',
                  version: QrVersions.auto,
                  size: 300,
                  gapless: false,
                )),
            Container(
                width: 300,
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "Show this to your doctor",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20, // Adjust the font size as needed
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
