import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';


class QrScanner extends StatefulWidget {

  final Function(String data) onScan;
  
  QrScanner({
    required this.onScan
  });

  @override
  State<StatefulWidget> createState() => _QrScannerState();
}



class _QrScannerState extends State<QrScanner> {

  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildQrView(context),
          _buildTopMenu(context),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }


  Widget _buildTopMenu(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 24.0),  // TODO: Can we calculate this?
    child: Row(
      children: [
        IconButton(
          onPressed: exit, 
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        Spacer(flex: 1),
        IconButton(
          onPressed: toggleFlash, 
          icon: Icon(Icons.flash_on),
          color: Colors.white,
        )
      ],
    ),
  );


  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen(onData);
  }


  void onData(Barcode scanData) {
    if (scanData.format == BarcodeFormat.qrcode) {
      controller?.dispose();
      widget.onScan(scanData.code);
      exit();
    }
  }


  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }


  void exit() {
    Navigator.of(context).pop();
  }

  void toggleFlash() {

  }

}