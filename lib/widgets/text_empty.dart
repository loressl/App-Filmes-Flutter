import 'package:flutter/material.dart';

class TextEmpty extends StatelessWidget{
  final String msg;

  TextEmpty(this.msg);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          msg,
          style: TextStyle(color: Color(0xFF9E0206), fontSize: 24),
        )
      ],
    );
  }
}
