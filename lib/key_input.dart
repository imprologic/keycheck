import 'package:flutter/material.dart';


class KeyInput extends StatefulWidget {

  final String? hint;
  final Function valueChange;


  KeyInput({ 
    Key? key, 
    this.hint,
    required this.valueChange
  }) : super(key: key);


  showScanner() {

  }


  @override
  State<StatefulWidget> createState() => _KeyInputState();

}



class _KeyInputState extends State<KeyInput> {

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: widget.hint
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 8),
        child: ElevatedButton(
          onPressed: widget.showScanner(), 
          child: Icon(Icons.qr_code),
        ),
      )
    ],
  );

}