import 'package:flutter/material.dart';
import 'package:tappeando/src/ui/home/home_screen.dart';
import 'package:tappeando/src/ui/login/login_screen.dart';
import 'package:tappeando/src/ui/splash/splash_screen.dart';
import 'package:tappeando/src/repository/authentication.dart';

void main() => runApp(TappeandoApp());

class TappeandoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tappeando',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        'splash': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(auth: Auth()),
      },
    );
  }
}