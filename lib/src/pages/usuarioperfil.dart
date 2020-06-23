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
      appBar: new AppBar(title: new Text('HealtRutine'), 
       backgroundColor: Color(0xFF5F44A3),
       actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
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
            backgroundAsset :'assets/images/fondoPerfil.jpg',
            userAsset:'img/Usuario.png',
            username:'John  Doe',
          ),

          Container(
            color: Color.fromARGB(40, 0, 275, 0),
            padding: EdgeInsets.symmetric(vertical:10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
             Column(children:<Widget>[Text('Completados',),
             Text('39')],),
              Column(children:<Widget>[Text('Frecuencia'),
              Text('67 %')],),
               Column(children:<Widget>[Text('Level'),
               Text('3')],),
            ],),
          ),
           Divider(
                    height: 40,
                  ),
         RaisedButton(
           shape: RoundedRectangleBorder(
             borderRadius : BorderRadius.circular(30.0),
           ),
          onPressed: _onPressed, 
           child: Text('Editar Perfil',style: TextStyle(fontSize: 16)),
           color:  Color(0xFFBE3636),
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
      padding: EdgeInsets.only(bottom: 25),
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
        Text('@${this.username}',
        style: TextStyle(
    fontSize: 19,
    color: Colors.white,
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
      margin: EdgeInsets.only(bottom: 5),
    );
  }
}