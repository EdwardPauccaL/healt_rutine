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
  BottomNavBar({Key key,@required this.name}) :  super(key: key);
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

  Widget _pageChosser(int page){
    switch(page){
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
        child: new Text("No selecciono Page"
        ),
        ),
      );
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: pageIndex,
          height: 50.0,
          
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.fitness_center, size: 30),
            Icon(Icons.music_note, size: 30),
            Icon(Icons.fastfood, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Color(0xFF5F44A3),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChosser(tappedIndex);
            });
          },
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