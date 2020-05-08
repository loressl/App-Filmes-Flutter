import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginInput{
  String login;
  String senha;

  toMap(){
    return{
      "login":login,
      "senha":senha,
    };
  }
}

class LoginApi{

}
