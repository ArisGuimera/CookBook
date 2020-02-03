import 'package:flutter/material.dart';
import 'package:tappeando/src/blocs/splash_bloc.dart';
import 'package:tappeando/src/common/resources.dart';
import 'package:tappeando/src/model/appinformation_model.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SplashBloc();
    bloc.getAppInformation();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(
        builder: (context) {
          _listenSuccessStates(context, bloc);
          return _content(bloc);
        },
      ),
    );
  }

  void _listenSuccessStates(BuildContext context, SplashBloc bloc) {
    final onData = (Resource state) {
      if (state.status == Status.SUCCESS) {
        _openMain();
      } else if (state.status == Status.ERROR) {
        final snackBar = SnackBar(content: Text(state.message));
        Scaffold.of(context).showSnackBar(snackBar);
      }
    };

    bloc.appInformation.listen(onData);
  }

  Widget _content(SplashBloc bloc) {
    return Container(
        child: Center(
      child: StreamBuilder(
        initialData: Resource<AppInformationModel>.idle(),
        stream: bloc.appInformation,
        builder: (context, asyncSnapshot) {
          return Center(
              child: Text('Tappeando BETA',
                  style: TextStyle(color: Colors.white, fontSize: 30.0)));
        },
      ),
    ));
  }

  void _openMain() {
    Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false);
  }
}
