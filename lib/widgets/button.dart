import 'package:flutter/material.dart';

class AppButton extends StatelessWidget{
  final String text;
  final VoidCallback callback;
  final bool showProgress;

  AppButton(this.text, this.callback, {this.showProgress= false});

  @override
  Widget build(BuildContext context) {
    final backgroundColor1 = Color(0xFF9E0206);
    final backgroundColor2 = Color(0xFFDD381E);
    final textColor= Colors.white;

    return Container(
      width:200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
          color: backgroundColor1,
        gradient: LinearGradient(
          colors: [backgroundColor1, backgroundColor2],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
        ),
      ),
      child: FlatButton(
        child: showProgress
          ?Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          ):Text(
            text,
            style:TextStyle(
              fontSize: 18,
              color: textColor,
            ),
          ),
        onPressed: callback,
      ),
    );
  }
}
