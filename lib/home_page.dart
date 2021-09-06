import 'package:flutter/material.dart';
import 'package:keycheck/btc_util.dart';
import 'package:keycheck/qr_input.dart';

class HomePage extends StatefulWidget {

  final String title;

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
  
}



class _HomePageState extends State<HomePage> {

  final publicAddressController = TextEditingController();
  final privateKeyController = TextEditingController();
  String _status = '';


  @override
  void initState() {
    super.initState();    
    publicAddressController.addListener(_onChange);
    privateKeyController.addListener(_onChange);
  }


  void _onChange() {
    // print('[ ${publicAddressController.text}, ${privateKeyController.text} ]');
    if (privateKeyController.text.length > 0 && publicAddressController.text.length > 0) {
      _setStatus(_isValid() ? 'VALID' : 'INVALID');
    } else {
      _setStatus('');
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
    _setStatus('');
  }


  void _setStatus(String status) {
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
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: QrInput(
                  hint: 'Public address',
                  controller: publicAddressController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: QrInput(
                  hint: 'Private key',
                  controller: privateKeyController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(_status)
              ),
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

}
