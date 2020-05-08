import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget{
  final String label;
  final String hint;
  final Function validator;
  final Function onSaved;
  final bool password;

  AppText(this.label, this.hint,
    {this.validator,this.onSaved, this.password=false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: this.validator,
      onSaved: this.onSaved,
      obscureText: password,
      keyboardType: TextInputType.text,
      style: TextStyle(
        color: Colors.lightBlue,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        labelText: this.label,
        labelStyle: TextStyle(
          color: Colors.lightBlue, fontSize: 18, fontWeight: FontWeight.bold,
        ),
        hintText: this.hint,
        hintStyle: TextStyle(
          color: Theme.of(context).hintColor,
          fontSize: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        errorStyle: TextStyle(fontSize: 18)
      ),
    );
  }
}
