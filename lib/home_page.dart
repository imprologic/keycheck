import 'package:flutter/material.dart';
import 'package:keycheck/btc_util.dart';
import 'package:keycheck/qr_input.dart';
import 'package:keycheck/validation_status.dart';

class HomePage extends StatefulWidget {

  static const String VALID = 'VALID';
  static const String INVALID = 'INVALID';

  final String title = 'BTC Wallet Checker';

  final publicAddressController = TextEditingController();
  final privateKeyController = TextEditingController();

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
  
}



class _HomePageState extends State<HomePage> {

  static const double SPACING = 20;

  ValidationStatus _status = ValidationStatus.idle;

  late TextEditingController publicAddressController = widget.publicAddressController;
  late TextEditingController privateKeyController = widget.privateKeyController;

  static String textForStatus(ValidationStatus status) {
    switch (status) {
      case ValidationStatus.valid:
        return HomePage.VALID;
      case ValidationStatus.invalid:
        return HomePage.INVALID;
      default:
        return '';
    }
  }


  static Color colorForStatus(ValidationStatus status) {
    switch (status) {
      case ValidationStatus.valid:
        return Colors.green[200]!;
      case ValidationStatus.invalid:
        return Colors.red[200]!;
      default:
        return Colors.transparent;
    }
  }


  @override
  void initState() {
    super.initState();    
    publicAddressController.addListener(_onChange);
    privateKeyController.addListener(_onChange);
  }


  void _onChange() {
    if (privateKeyController.text.length > 0 && publicAddressController.text.length > 0) {
      _setStatus(_isValid() ? ValidationStatus.valid : ValidationStatus.invalid);
    } else {
      _setStatus(ValidationStatus.idle);
    }
  }


  bool _isValid() {
    try {
      return BtcUtil.validate(privateKeyController.text, publicAddressController.text);
    } catch (e) {
      print(e.toString());
      return false;
    }
  }


  void _clear() {
    privateKeyController.clear();
    publicAddressController.clear();
    _setStatus(ValidationStatus.idle);
  }


  void _setStatus(ValidationStatus status) {
    setState(() {
      _status = status;
    });
  }
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(SPACING),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildInput(context, publicAddressController, 'Public address'),
              _buildInput(context, privateKeyController, 'Private key'),
              _buildResult(context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clear,
        tooltip: 'Clear',
        child: Icon(Icons.delete),
      ),
    );
  }


  _buildInput(BuildContext context, TextEditingController controller, String hint) => Padding(
    padding: EdgeInsets.only(bottom: SPACING),
    child: QrInput(
      controller: controller,
      hint: hint,
    ),
  );


  _buildResult(BuildContext context) => Container(
    width: double.infinity,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: colorForStatus(_status),
      borderRadius: BorderRadius.all(Radius.circular(SPACING))
    ),
    child: Padding(
      padding: EdgeInsets.all(SPACING),
      child: Text(
        textForStatus(_status),
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
      )
    ),
  );

}
