import 'package:flutter/material.dart';
import 'package:keycheck/qr_scanner.dart';


class QrInput extends StatefulWidget {
  

  final String? hint;
  final TextEditingController controller;


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
            border: OutlineInputBorder(),
            hintText: widget.hint,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 8),
        child: ElevatedButton(
          onPressed: showScanner, 
          child: Icon(Icons.qr_code),
        ),
      )
    ],
  );


  showScanner() {
    print('*** showScanner ***');
    Navigator.push(
      context, 
      MaterialPageRoute<void>(
        builder: (BuildContext context) => QrScanner()
      )
    );
  }


}