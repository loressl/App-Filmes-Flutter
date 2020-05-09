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
          color: Theme.of(context).primaryColor,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          labelText:this.label ,
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
          ),
          hintText: this.hint,
          hintStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
          ),
          //border: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          filled: true,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          errorStyle: TextStyle(fontSize: 13)
        ),
    );
  }
}
