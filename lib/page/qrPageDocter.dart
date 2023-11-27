import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:medtrack/page/medicalRecord.dart';

class qrPageDocter extends StatelessWidget {
  const qrPageDocter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Scanner')),
      body: MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.normal,
          facing: CameraFacing.front,
          torchEnabled: true,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            debugPrint('Barcode found! ${barcode.rawValue}');

            // Show a pop-up dialog with a button to navigate to MedicalRecord page
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Barcode Detected'),
                  content: Text(
                      'Do you want to view the medical record for this barcode?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Close the dialog
                        Navigator.of(context).pop();

                        // Direct the user to the MedicalRecord page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => medicalRecord()),
                        );
                      },
                      child: Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Close the dialog
                        Navigator.of(context).pop();
                      },
                      child: Text('No'),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
