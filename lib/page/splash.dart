import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medtrack/page/signIn.dart';
import 'package:medtrack/page/signUp.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF5FF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.all(40),
              child: SvgPicture.asset('assets/icons/Symbol Kanan Atas.svg'),
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: 454.68,
              height: 105.74,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            'MedTrack',
                            style: TextStyle(
                                color: Color(0xFF090D1D),
                                fontSize: 41.84,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            'Bridging care, Building Health',
                            style: TextStyle(
                                color: Color(0xFF3D4966),
                                fontSize: 22.32,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(right: 200), // Negative margin to move the image off-screen to the left
            //   child: SvgPicture.asset(
            //     'assets/Orang.svg',

            //   ),
            // ),
            // Container(
            //   alignment: Alignment.centerRight,
            //   margin: const EdgeInsets.all(40),
            //   child: SvgPicture.asset('assets/Button.svg'),
            // ),
            Stack(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: SvgPicture.asset('assets/icons/Orang.svg'),
                ),
                MouseRegion(
                    child: GestureDetector(
                  onTap: () {
                    // Navigate to another page here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signIn()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 300, right: 30),
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset('assets/icons/Button Primary.svg'),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
