import 'package:flutter/material.dart';
import 'package:app_filmes/widgets/bg_login.dart';
import 'package:app_filmes/login/login_api.dart';
import 'package:app_filmes/widgets/textfield.dart';
import 'package:app_filmes/utils/validators.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _input = LoginInput();
  //final _bloc =

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BgLogin(),
          _body(),
        ],
      ),
    );
  }

  _body(){
    return Form(
      key:_formKey,
      child: Container(
        alignment:Alignment.bottomLeft,
        padding: EdgeInsets.fromLTRB(10, 230,70, 15),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 16),
              child: AppText(
                "Login",
                "Digite o seu login",
                validator: (text){
                  return validateRequired(text, "Informe o login");
                },
                onSaved: (value)=>this._input.login=value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: AppText(
                "Senha",
                "Digite o seu Senha",
                validator: (text){
                  return validateRequired(text, "Informe a senha");
                },
                onSaved: (value)=>this._input.login=value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
