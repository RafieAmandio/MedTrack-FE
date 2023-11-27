import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'User Home Screen', 
      theme: ThemeData( 
        primarySwatch: Colors.green, 
        fontFamily: 'Plus Jakarta Sans',
      ), 
      home: UserHomeScreen(), 
      debugShowCheckedModeBanner: false, 
    ); 
  } 
}

class UserHomeScreen extends StatelessWidget{
  bool shadowColor = false;
  double? scrolledUnderElevation;

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFEDF5FF),
      body: Column(
        children: [
          Container(
            color: Color(0xFFEDF5FF),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(Icons.calendar_today, color: Color(0xFF458CFF)),
                SizedBox(width: 8),
                Text(
                  _getFormattedDate(),
                  style: TextStyle(fontSize: 16, color: Color(0xFF818BA0), fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w800),
                ),
                Spacer(),
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
                  child: SvgPicture.asset('assets/Bell.svg', height: 40, width: 40,),
                ))
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome, Admin! 👋',
                      style: TextStyle(
                        color: Color(0xFF090D1D),
                        fontSize: 26.14,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w800,
                        height: 0.05,
                        letterSpacing: -1.05,
                      ),
                    ),
                    TextSpan(
                      text: ' ',
                      style: TextStyle(
                        color: Color(0xFF090D1D),
                        fontSize: 26.14,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w800,
                        height: 0.05,
                        letterSpacing: -0.78,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Last Appointment',
                      style: TextStyle(
                        color: Color(0xFF090D1D),
                        fontSize: 22,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w800,
                        height: 0.05,
                        letterSpacing: -1.05,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 20),
            width: 600,
            height: 200,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 337,
                    height: 175,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0F66FE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 145.0, right: 16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Diagnosa',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 15,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w800,
                              height: 0.05,
                              letterSpacing: -1.05,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 70.0, left: 145.0, right: 16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Gejala',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 15,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w800,
                              height: 0.05,
                              letterSpacing: -1.05,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 125.0, left: 145.0, right: 16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Obat',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 15,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w800,
                              height: 0.05,
                              letterSpacing: -1.05,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Your Medicine',
                      style: TextStyle(
                        color: Color(0xFF090D1D),
                        fontSize: 22,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w800,
                        height: 0.05,
                        letterSpacing: -1.05,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SafeArea(
            child: Column(
              children: [
                TextButton(
                  onPressed: null,
                  child: Text("Button"),
                ),
                // Add more widgets as needed for the body content
              ],
            ),
          ),
        ],
      ),
    );
  }
  String _getFormattedDate() {
    // Replace this with your logic to get the current date in the desired format
    DateTime now = DateTime.now();
    String formattedDate = "${_getDayOfWeek(now.weekday)}, ${now.day} ${_getMonth(now.month)} ${now.year}";
    return formattedDate;
  }

  String _getDayOfWeek(int day) {
    // Replace this with your logic to get the day of the week
    List<String> daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return daysOfWeek[day - 1];
  }

  String _getMonth(int month) {
    // Replace this with your logic to get the month
    List<String> months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
}
