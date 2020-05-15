import 'package:flutter/material.dart';

class AppButtonCancel extends StatelessWidget{
  final String text;
  final VoidCallback callback;

  AppButtonCancel(this.text, this.callback);

  @override
  Widget build(BuildContext context) {
    final color = Color(0xFF9E0206);

    return Container(
      width: 200,
      child: OutlineButton(
        borderSide: BorderSide(color: color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22),),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: color,
          ),
        ),
        onPressed: callback,
      ),
    );
  }
}
