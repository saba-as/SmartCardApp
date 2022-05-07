import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:smartcardapp/data/api/get_student.dart';
import 'package:smartcardapp/providers/student_provider.dart';
import 'package:smartcardapp/views/result.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          QRView(
            overlay: QrScannerOverlayShape(
              borderColor: Colors.white,
              overlayColor: Colors.black.withOpacity(0.7),
            ),
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
          Positioned(
            bottom: 100,
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  'امسح الرمز',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
          Positioned(
            top: 100,
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        'assets/images/logo.jpeg',
                        scale: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '(تطبيق هويات كلية الامام الكاظم (ع',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen(
      (scanData) {
        controller.pauseCamera();
        Provider.of<StudentProvider>(context, listen: false)
            .setStudent(scanData.code ?? "");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Result(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
