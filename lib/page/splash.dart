import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return  Scaffold(
      backgroundColor: const Color(0xFFEDF5FF),
      
      body: SafeArea(
        child: Column(
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
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 454.68,
                            child: Text(
                              'MedTrack',
                              style: TextStyle(
                                color: Color(0xFF090D1D),
                                fontSize: 41.84,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w800,
                                height: 0.03,
                                letterSpacing: -1.67,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 454.68,
                            child: Text(
                              'Bridging care, Building Health',
                              style: TextStyle(
                                color: Color(0xFF3D4966),
                                fontSize: 22.32,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w500,
                                height: 0.07,
                              ),
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          content: Text('HELLOO'),
                        );
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 300, right: 10),
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