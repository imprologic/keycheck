import 'package:flutter/material.dart';
import 'package:keycheck/qr_input.dart';

class HomePage extends StatefulWidget {

  final String title;

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
  
}



class _HomePageState extends State<HomePage> {

  String _status = '';
  final publicAddressController = TextEditingController(text: 'addr');
  final privateKeyController = TextEditingController(text: 'pk');


  void _clear() {
    privateKeyController.clear();
    publicAddressController.clear();
    setState(() {
      _status = '';
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
