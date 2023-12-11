import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medtrack/page/qrPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:medtrack/page/signIn.dart';

class UserHomeScreen extends StatefulWidget {
 final Map<String, dynamic> user;

 UserHomeScreen({required this.user});
 @override
 _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  int _selectedIndex = 0;
  late Future<List<dynamic>> futureData;
  String userName = 'Admin'; // Default user name
  List<Widget> _pages = []; // Define _pages as an instance variable

  @override
  void initState() {
    super.initState();
    futureData = UserHome().fetchData();
    fetchUserData();
  }

  

  void fetchUserData() async {
  // Replace this with your actual API endpoint
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

  if (response.statusCode == 200) {
    // Replace this with your actual data structure
    Map<String, dynamic> userData = jsonDecode(response.body);
    setState(() {
      userName = userData['name'];
    });
  } else {
    throw Exception('Failed to load user data');
  }
  setState(() {
   userName = widget.user['name'];
   _pages = [
     UserHomePage(user: widget.user),
     // Add other pages as needed
     // Example: PageTwo(),
     // Example: PageThree(),
     // Example: PageFour(),
   ];
 });
}
@override
 Widget build(BuildContext context) {
   List<Widget> _pages = [
   UserHomePage(user: widget.user),
   // Add other pages as needed
   // Example: PageTwo(),
   // Example: PageThree(),
   // Example: PageFour(),
 ];

    return Scaffold(
      backgroundColor: const Color(0xFFEDF5FF),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF0F66FE)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => qrPage()), // Replace with your QR code page
                );
              },
              child: Icon(Icons.qr_code, color: Color(0xFF0F66FE)),
            ),
            label: 'QR Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xFF0F66FE)),
            label: 'Profile',
          ),
          // BottomNavigationBarItem(
          //  icon: Icon(Icons.settings, color: Color(0xFF0F66FE)),
          //  label: 'Settings',
          // ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index < _pages.length) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}

class UserHome {
 Future<List<dynamic>> fetchData() async {
  // URL of the API endpoint
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

   final response = await http.get(Uri.parse(apiUrl));

   if (response.statusCode == 200) {
     return json.decode(response.body);
   } else {
     throw Exception('Failed to load data');
   }
 }
}

class UserHomePage extends StatelessWidget {
  bool shadowColor = false;
  double? scrolledUnderElevation;
  final Map<String, dynamic> user;

 UserHomePage({required this.user});
  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF818BA0),
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => signIn()), // Replace with your QR code page
                  );
                  },
                ),
                MouseRegion(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserHomeScreen(user: {}),
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/icons/Bell.svg',
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome, ${user['username']}!! 👋',
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
                  padding:
                      EdgeInsets.only(top: 125.0, left: 145.0, right: 16.0),
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
          MedicationWidget(
            medicationName: 'Medication 1',
            medicationDescription: 'Description for Medication 1.',
            imagePath: 'assets/icons/Bell.svg', // Adjust the path accordingly
          ),
          MedicationWidget(
            medicationName: 'Medication 2',
            medicationDescription: 'Description for Medication 2.',
            imagePath: 'assets/icons/Bell.svg', // Adjust the path accordingly
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
    String formattedDate =
        "${_getDayOfWeek(now.weekday)}, ${now.day} ${_getMonth(now.month)} ${now.year}";
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
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }
}

class MedicationWidget extends StatelessWidget {
  final String medicationName;
  final String medicationDescription;
  final String imagePath;

  MedicationWidget({
    required this.medicationName,
    required this.medicationDescription,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Medication Image
          Container(
            margin: EdgeInsets.only(right: 16),
            width: 80,
            height: 80,
            child: SvgPicture.asset(
              imagePath,
              height: 80,
              width: 80,
            ),
          ),
          // Medication Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicationName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  medicationDescription,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}