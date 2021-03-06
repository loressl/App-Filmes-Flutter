import 'package:flutter/material.dart';
import 'package:app_filmes/login/login_page.dart';
import 'package:app_filmes/utils/nav.dart';

class DrawerMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName:Text("Iron Man"),
              accountEmail: Text("ironman@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/perfil.jpg"),
              ),
            ),
            ListTile(
              onTap: (){
                print("Perfil");
              },
              title: Text("Perfil"),
              leading: Icon(Icons.person),
            ),
            ListTile(
              onTap: (){
                print("Configurações");
              },
              title: Text("Configurações"),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              onTap: (){
                print("Ajuda");
              },
              title: Text("Ajuda"),
              leading: Icon(Icons.help),
            ),
            ListTile(
              onTap: (){
                _logout(context);
              },
              title: Text("Logout"),
              leading: Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }

  void _logout(context){
    pushReplacement(context, LoginPage());
  }
}
