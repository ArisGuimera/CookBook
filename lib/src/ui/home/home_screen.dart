import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tappeando/src/blocs/navbar_bloc.dart';
import 'package:tappeando/src/ui/map/map_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NavBarBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = NavBarBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tappeando'),
      ),
      body: StreamBuilder(
        stream: bloc.navItem,
        initialData: bloc.defaultItem,
        builder: (context, AsyncSnapshot<NavBarItem> snapshot) {
          switch (snapshot.data) {
            case NavBarItem.HOME:
              return MapScreen();
            case NavBarItem.REWARDS:
              return _alertArea();
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){_onClickFAB();},
        child: Icon(Icons.camera_enhance),
      ),
      bottomNavigationBar: StreamBuilder(
        stream: bloc.navItem,
        initialData: bloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return BottomNavigationBar(
            fixedColor: Colors.blueAccent,
            currentIndex: snapshot.data.index,
            onTap: bloc.selectItem,
            items: [
              BottomNavigationBarItem(
                title: Text('Home'),
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                title: Text('Premios'),
                icon: Icon(Icons.notifications),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _alertArea() {
    return Center(
      child: Text(
        'Notifications Screen',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.red,
          fontSize: 25.0,
        ),
      ),
    );
  }

  Future<void> _onClickFAB() {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Take a picture'),
                    onTap: openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('Select from gallery'),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }


  Future openCamera() async {
    var picture = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    print(picture.toString());
  }

  Future openGallery() async {
    var gallery = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    print(gallery.toString());
  }

}
