import 'package:rxdart/rxdart.dart';

class NavBarBloc{
  final _observable = PublishSubject<NavBarItem>();
  NavBarItem defaultItem = NavBarItem.HOME;

  Observable<NavBarItem> get navItem => _observable.stream;

  void selectItem(int i){
    switch(i){
      case 0:
        _observable.sink.add(NavBarItem.HOME);
        break;
      case 1:
        _observable.sink.add(NavBarItem.REWARDS);
        break;
    }
  }

  dispose(){
    _observable.close();
  }

}

enum NavBarItem{HOME, REWARDS}
