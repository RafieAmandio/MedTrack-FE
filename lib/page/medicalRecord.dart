import 'package:flutter/material.dart';

class MedicalRecord extends StatelessWidget {
  final String? rawValue;

  const MedicalRecord({Key? key, this.rawValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Record'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is medical record',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Barcode Value: ${rawValue ?? 'N/A'}',
              style: TextStyle(fontSize: 16),
            ),
            // Add other widgets or functionalities as needed
          ],
        ),
      ),
    );
  }
}
