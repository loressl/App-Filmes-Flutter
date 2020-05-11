import 'package:flutter/material.dart';

class AppButton extends StatelessWidget{
  final String text;
  final VoidCallback callback;
  final bool showProgress;

  AppButton(this.text, this.callback, {this.showProgress= false});

  @override
  Widget build(BuildContext context) {
    //final backgroundColor1 = Color(0xFF84E4F2);
    //final backgroundColor2 = Color(0xFF2C8ACA);
    //final textColor = Color(0xFF001B50);
    //final textColor= Color(0xFFCCE5FF);

    final color= Colors.black;
    return Container(
      width:200,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(22),
      //     color: Color(0xFF2C8ACA),
      //   // gradient: LinearGradient(
      //   //   colors: [backgroundColor1, backgroundColor2],
      //   //   begin: FractionalOffset.topCenter,
      //   //   end: FractionalOffset.bottomCenter,
      //   // ),
      // ),
      child: OutlineButton(
        borderSide: BorderSide(color: color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22), ),
        child: showProgress?
          Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ):Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: callback,
      ),
    );
  }
}
