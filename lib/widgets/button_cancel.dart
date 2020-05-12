import 'package:flutter/material.dart';

class AppButtonCancel extends StatelessWidget{
  final String text;
  final VoidCallback callback;

  AppButtonCancel(this.text, this.callback);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color(0xFF9E0206);
    final textColor = Colors.white;

    return Container(
      width: 200,
      height: 40,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: FlatButton(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: textColor,
          )
        ),
        onPressed: callback,
      ),
    );
  }
}
