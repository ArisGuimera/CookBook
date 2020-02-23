import 'package:flutter/material.dart';
import 'package:tappeando/src/repository/authentication.dart';
import 'package:tappeando/src/root_screen.dart';

void main() => runApp(TappeandoApp());

class TappeandoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tappeando',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new RootPage(
        auth: new Auth(),
      ),
    );
  }
}
