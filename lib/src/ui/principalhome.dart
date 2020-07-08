import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:healt_rutine/src/pages/dietasrec.dart';
import 'package:healt_rutine/src/pages/inicio.dart';
import 'package:healt_rutine/src/pages/musicaRem.dart';
import 'package:healt_rutine/src/pages/usuarioperfil.dart';
import 'package:healt_rutine/src/ui/home.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
  final String name;
  BottomNavBar({Key key, @required this.name}) : super(key: key);
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final Inicio _inicio = Inicio(name: null);
  final Home _home = new Home(name: null);
  final MusicPlayer _musicPlayer = new MusicPlayer();
  //final MyCalculatorApp _myCalculatorApp = new  MyCalculatorApp();
  final DietasRec _dietasRec = new DietasRec();
  final PerfilUsu _perfilUsu = new PerfilUsu();

  Widget _showPage = new Inicio(name: null);

  Widget _pageChosser(int page) {
    switch (page) {
      case 0:
        return _inicio;
        break;
      case 1:
        return _home;
        break;
      case 2:
        return _musicPlayer;
        break;
      case 3:
        return _dietasRec;
        break;
      case 4:
        return _perfilUsu;
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text("No selecciono Page"),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          key: _bottomNavigationKey,
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChosser(tappedIndex);
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              title: Text('Workout'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              title: Text('Music'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood), title: Text('Food')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Profile')),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromRGBO(95, 68, 163, 1),
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: _showPage,
            //child: Column(
            //children: <Widget>[

            ///RaisedButton(
            //child: Text('Go To Page of index 1'),
            // onPressed: () {
            //final CurvedNavigationBarState navBarState =
            //  _bottomNavigationKey.currentState;
            //navBarState.setPage(1);
            //},
            //)
            //],
            //),
          ),
        ));
  }
}
