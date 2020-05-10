import 'package:app_filmes/utils/response.dart';

class CadastroInput{
  String nome;
  String login;
  String email;
  String senha;

  toMap(){
    return {
      "nome":nome,
      "login":login,
      "email":email,
      "senha":senha,
    };
  }

  @override
  String toString() {
    return "${toMap()}";
  }
}

class CadastroApi{
  static Future<GenericResponse> cadastrar(CadastroInput c) async{
    print("> post cadastro $c");

    await Future.delayed(Duration(seconds: 2));
    return GenericResponse(true);
  }
}
