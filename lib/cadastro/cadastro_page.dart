import 'package:flutter/material.dart';
import 'package:app_filmes/utils/alerts.dart';
import 'package:app_filmes/utils/nav.dart';
import 'package:app_filmes/utils/validators.dart';
import 'package:app_filmes/widgets/button.dart';
import 'package:app_filmes/widgets/textfield.dart';
import 'package:app_filmes/widgets/button_cancel.dart';

import 'package:app_filmes/home/home_page.dart';

import 'cadastro_api.dart';
import 'cadastro_bloc.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {

  final _formKey = GlobalKey<FormState>();
  final _input = CadastroInput();
  final _bloc = CadastroBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF001B50),
      appBar: AppBar(
        title: Text("Cadastrar"),
        backgroundColor:Color(0xFF001B58),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _body(),
        ],
      ),
    );
  }

  _body(){
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.asset("assets/images/deadpooloscar.jpg",
                  width: 120, height: 120,),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: AppText(
                "Nome",
                "Digite o seu nome",
                validator: (text){
                  return validateRequired(text, "Informe o nome");
                },
                onSaved: (value) => this._input.nome = value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: AppText(
                "Email",
                "Digite o seu email",
                validator: (text){
                  return validateRequired(text, "Informe o email");
                },
                onSaved: (value) => this._input.email = value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:5),
              child: AppText(
                "Login",
                "Digite o seu login",
                validator: (text){
                  return validateRequired(text, "Informe o login");
                },
                onSaved: (value) => this._input.login = value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: AppText(
                "Senha",
                "Digite a sua senha",
                validator: (text){
                  return validateRequired(text, "Informe a senha");
                },
                onSaved: (value) => this._input.senha = value,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child:StreamBuilder<bool>(
                    stream: _bloc.progress.stream,
                    initialData: false,
                    builder: (context, snapshot){
                      return Container(
                        margin:EdgeInsets.only(top: 10),
                        child: AppButton(
                          "Cadastrar",
                          _onClickCadastrar,
                          showProgress: snapshot.data,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child:Container(
                    margin: EdgeInsets.only(top: 10),
                    child: AppButtonCancel(
                      "Cancelar",
                      _onClickCancelar,
                    ),
                  ),
                ),
              ],
            ),
            // StreamBuilder<bool>(
            //   stream: _bloc.progress.stream,
            //   initialData: false,
            //   builder: (context, snapshot){
            //     return Container(
            //       margin:EdgeInsets.only(top: 10),
            //       child: AppButton(
            //         "Cadastrar",
            //         _onClickCadastrar,
            //         showProgress: snapshot.data,
            //       ),
            //     );
            //   },
            // ),
            // Container(
            //   margin: EdgeInsets.only(top: 8),
            //   child: AppButtonCancel(
            //     "Cancelar",
            //     _onClickCancelar,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  _onClickCadastrar() async{
    if(!_formKey.currentState.validate())
      return;

    //chama o onsaved
    _formKey.currentState.save();

    final response = await _bloc.cadastrar(_input);
    if(response.isOk()){
      print("ok");
      pushReplacement(context, null);
    }else{
      alert(context, "Filmes", response.msg);
    }
  }

  void _onClickCancelar(){
    pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

}
