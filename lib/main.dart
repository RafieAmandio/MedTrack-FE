import 'package:flutter/material.dart';
import 'package:medtrack/page/UserHome.dart';
import 'package:medtrack/page/appointmentDocter.dart';
import 'package:medtrack/page/qrPageDocter.dart';

import 'page/signIn.dart';
import 'page/qrPage.dart';
import 'page/splash.dart';
import 'page/qrPageDocter.dart';
import 'page/UserHome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'PlusJakartaSans'),
        home: splash());
  }
}
