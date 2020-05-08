import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:app_filmes/login/login_page.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs:[

      ],
      child: MaterialApp(
        title: "App Filmes",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor:Colors.lightBlue,
          hintColor: Colors.lightBlue,
        ),
        home: LoginPage(),
      ),
    );
  }
}
