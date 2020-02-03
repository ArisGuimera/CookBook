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
        print("sucesss");
        _openMain();
      } else if (state.status == Status.ERROR) {
        print("error");
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
          return Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Expanded(child: new Image.asset(
                  'images/splash.jpg', fit: BoxFit.fitHeight,
                ),

                )
              ]


//            child: Container(
//              child: new Stack(
//                children: <Widget>[
//                  new Image.asset(
//                    'images/splash.jpg',
//                    width: 100,
//                    height: 100,
//                  ),
//                ],
//              ),
//            ),
          );
        },
      ),
    ));
  }

  void _openMain() {
    Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false);
  }
}
