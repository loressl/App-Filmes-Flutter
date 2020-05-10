import 'package:flutter/material.dart';

class AppButton extends StatelessWidget{
  final String text;
  final VoidCallback callback;
  final bool showProgress;

  AppButton(this.text, this.callback, {this.showProgress= false});

  @override
  Widget build(BuildContext context) {
    final backgroundColor1 = Color(0xFF84E4F2);
    final backgroundColor2 = Color(0xFF2C8ACA);
    final textColor = Color(0xFF001B50);
    return Container(
      width:200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: [backgroundColor1, backgroundColor2],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
        ),
      ),
      child: FlatButton(
        child: showProgress?
          Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          ):Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: callback,
      ),
    );
  }
}
