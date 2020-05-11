import 'package:flutter/material.dart';
import 'package:app_filmes/widgets/bg_login.dart';
import 'package:app_filmes/login/login_api.dart';
import 'package:app_filmes/widgets/textfield.dart';
import 'package:app_filmes/utils/validators.dart';
import 'package:app_filmes/widgets/button.dart';
import 'package:app_filmes/utils/nav.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:app_filmes/widgets/link.dart';
import 'login_bloc.dart';
import 'package:app_filmes/cadastro/cadastro_page.dart';
import 'package:app_filmes/utils/alerts.dart';
import 'package:app_filmes/home/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _input = LoginInput();
  final _bloc =  LoginBloc();

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
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 60, 5, 10),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text("Bem-Vindo", style: TextStyle(color: Colors.black,fontSize: 35, fontWeight: FontWeight.bold),),
              SizedBox(height: 20.0,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 5),
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
                        margin: EdgeInsets.only(top: 5),
                        child: AppText(
                          "Senha",
                          "Digite a sua senha",
                          password:true,
                          validator: (text){
                            return validateRequired(text, "Informe a senha");
                          },
                          onSaved: (value)=>this._input.senha=value,
                        ),
                      ),
                      StreamBuilder<bool>(
                        stream: _bloc.progress.stream,
                        initialData: false,
                        builder:(context, snapshot) {
                          return Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top:16),
                            child: AppButton(
                              "Login",
                              _onClickLogin,
                              showProgress: snapshot.data,
                            ),
                          );
                        },
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 10),
                        child: GoogleSignInButton(
                          onPressed: _onClickGoogle,
                          borderRadius: 22,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Center(
                          child: AppLink(
                            "Cadastrar-se",
                            _onClickCadastro,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onClickLogin() async{
    if(!_formKey.currentState.validate())
      return;

    //salva o form
    _formKey.currentState.save();

    print("Login: ${_input.login}, senha: ${_input.senha}");

    final response = await _bloc.login(_input);

    if(response.isOk()){
      print("ok homepage");
      pushReplacement(context, HomePage());
    }else{
      alert(context, "Filmes", response.msg);
    }
  }

  _onClickGoogle(){
    print("Google");
  }

  _onClickCadastro(){
    print("Cadastro");
    push(context, CadastroPage());
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
