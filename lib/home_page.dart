import 'package:flutter/material.dart';
import 'package:keycheck/key_input.dart';

class HomePage extends StatefulWidget {

  final String title;

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
  
}



class _HomePageState extends State<HomePage> {

  void _privateKeyChange() {

  }

  void _publicAddressChange() {

  }

  void _clear() {
    setState(() {

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
                child: KeyInput(
                  hint: 'Public address',
                  valueChange: _publicAddressChange,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: KeyInput(
                  hint: 'Private key',
                  valueChange: _privateKeyChange,
                ),
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
