import 'package:flutter/material.dart';
import 'package:keycheck/qr_scanner.dart';


class QrInput extends StatefulWidget {
  
  final TextEditingController controller;
  final String? hint;


  QrInput({
    Key? key,
    this.hint,
    required this.controller
  }): super(key: key);
 

  @override
  State<StatefulWidget> createState() => _QrInputState(controller);

}



class _QrInputState extends State<QrInput> {

  final TextEditingController controller;


  _QrInputState(this.controller);


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: widget.hint,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 8),
        child: ElevatedButton(
          onPressed: _showScanner, 
          child: Icon(Icons.qr_code),
        ),
      )
    ],
  );


  _onScan(String data) {
    this.controller.text = data;
  }


  _showScanner() {
    Navigator.push(
      context, 
      MaterialPageRoute<void>(
        builder: (BuildContext context) => QrScanner(onScan: _onScan)
      )
    );
  }


}