import 'package:flutter/material.dart';
import 'package:healt_rutine/src/pages/calculadora_imc.dart';
import 'package:healt_rutine/src/pages/nosotros.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healt_rutine/src/bloc/authentication_bloc/bloc.dart';

class PerfilUsu extends StatelessWidget {
  final VoidCallback _onPressed;

  PerfilUsu({Key key , VoidCallback onPressed})
  : _onPressed = onPressed,
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Profile',style: TextStyle(fontSize: 20, color:Color(0xFF5F44A3))), 
      centerTitle: true,
       backgroundColor: Color(0xFFFFFFFF),
       actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            splashColor: Color(0xFF5F44A3),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
          )
        ],

       ),
       
          drawer: new Drawer(
            child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text('', style: TextStyle(
                fontSize: 19,
                 color: Colors.black,)
                 ),
                  accountEmail: new Text(''),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('img/Usuario.png'),
                    )
                  ),
                ),
                new Divider(),
                new ListTile(
                  //Division para otra widget
                  title: new Text("Calculadora IMC"),
                  trailing: new Icon(Icons.fitness_center),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => MyCalculatorApp(),
                  )),
                ),
                new Divider(),
                new ListTile(
                  title: new Text("Soporte"),
                  trailing: new Icon(Icons.help),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Nosotros(),
                  )),
                ),
              ],
            ),
          ),

      //appBar: new AppBar(
        //backgroundColor: Color(0xFF5F44A3),
        //title: new Center(
        //child: new Text("Profile",
        //),
        //)
      //),

      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Header(
            height: 350,
            backgroundAsset :'assets/images/blanco.jpg',
            userAsset:'img/Usuario.png',
            username:'John  Doe',
          ),
         RaisedButton(
           shape: RoundedRectangleBorder(
             borderRadius : BorderRadius.circular(90.0),
           ),
          onPressed: _onPressed, 
           child: Text('Update Answers',style: TextStyle(fontSize: 18)),
           color:  Color(0xFF5F44A3),
         ),
         Divider(
                    height: 50,
                  ),
          Container(
            color: Color.fromARGB(0, 0, 0, 0),
            padding: EdgeInsets.symmetric(vertical:10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
             Column(children:<Widget>[Text('80',),
             Text('Weight')],),
              Column(children:<Widget>[Text('80%'),
              Text('Frequency')],),
               Column(children:<Widget>[Text('3'),
               Text('Level')],),
            ],),
          ),

        ],
      ),

    );
  }
}
//Cuerpo
class Header extends StatelessWidget {
  final double height;
  final String backgroundAsset;
  final String userAsset;
  final String username;
  const Header({
    Key key,
    this.height = 240,
    @required this.backgroundAsset,
    @required this.userAsset,
    @required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      padding: EdgeInsets.only(bottom: 40),
         decoration: BoxDecoration(
     image: DecorationImage(
      image: AssetImage(this.backgroundAsset),
        fit: BoxFit.cover
        ),
       // shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
        UserPhoto(
    assetImage: this.userAsset,
    size: 200,
        ),
        Text('${this.username}',
        style: TextStyle(
    fontSize: 26,
    color: Colors.black,
        ),),
      ],
      ),

    );
  }
}

//Foto Usuario
class UserPhoto extends StatelessWidget {
final String assetImage;
final double size;

  const UserPhoto({
    Key key,
    @required this.assetImage,
    this.size = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
       image: DecorationImage(
        image: AssetImage(this.assetImage),
          fit: BoxFit.fill,
       ),
       shape: BoxShape.circle,
      ),
      margin: EdgeInsets.only(bottom: 10),
    );
  }
}