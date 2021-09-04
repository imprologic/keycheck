import 'package:flutter/material.dart';


class KeyInput extends StatelessWidget {

  final String? hint;


  KeyInput({ 
    Key? key, 
    this.hint
  }) : super(key: key);


  showScanner() {

  }


  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hint
          ),
        ),
      ),
      IconButton(
        onPressed: showScanner(), 
        icon: Icon(Icons.qr_code)
      )
    ],
  );

}