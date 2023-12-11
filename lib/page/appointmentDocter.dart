import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class appointmentDocter extends StatelessWidget {
  final String? rawValue;

  const appointmentDocter({Key? key, this.rawValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDateTime =
        DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 0.4,
                  child: SvgPicture.asset(
                    'assets/icons/Orang.svg',
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  margin: EdgeInsets.only(left: 100, top: 180),
                  child: Text(
                    '$formattedDateTime',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  margin: EdgeInsets.only(left: 100, top: 200),
                  child: Text(
                    'Welcome, Dr. Heinz Doofenshmirtz!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  margin: EdgeInsets.only(left: 100, top: 300),
                  child: Text(
                    'Dokter Umum',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
