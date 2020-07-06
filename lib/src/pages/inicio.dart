import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  _HomeState createState() => _HomeState();
  final String name;
  Inicio({Key key, @required this.name}) : super(key: key);
}

class _HomeState extends State<Inicio> {
  //creamos un arreglo de datos imagenes y nombre ejercicio
  List<Container> listamos = List();

  var arreglox = [
    {
      "nombre": "Bienvenido",
      "imagen": "healtrutine.png",
      "descripcion":
          "Te has preguntado ¿En qué te puede ayudar la tecnología fitness para poder potenciar tu centro? Pues...  ¡Bienvenido a la era digital! Hablamos de tecnología fitness cuando nos referimos a los dispositivos de seguimiento para entrenamientos, máquinas de ejercicios y, por supuesto, sistemas o aplicativos de gestión para todo tipo de centros fitness.Gracias a ella, las boutiques fitness o gimnasios pueden ofrecer nuevas experiencias, al mejorar el servicio y agilizar procesos, logran fidelizar a sus clientes mediante la tecnología; además de posicionarlos como centros innovadores.El mercado de la industria fitness en Latinoamérica se encuentra en una etapa de apogeo, generando un aproximado de US 6 mil millones anuales. Actualmente casi 20 millones de latinoamericanos son miembros de algún centro o boutique fitness y el número va en aumento."
    },
    {
      "nombre": "Primeros Pasos",
      "imagen": "premiun2.png",
      "descripcion":
          "En todos los sectores de economía el impacto digital les dio un cambio de 360 grados  a los modelos tradicionales de negocios y es que con la tecnología las necesidades y las expectativas del consumidor han cambiado. Ahora nos enfrentamos a un nuevo consumidor."
    },
    {
      "nombre": "Prueba Premiun",
      "imagen": "Premiun.jpeg",
      "descripcion": "Trabajo con cinta 4 repeticiones de 15"
    },
    {
      "nombre": "Reto 28 Dias",
      "imagen": "cinta2.jpg",
      "descripcion": "Trabajo con cinta 2 repeticiones de 15"
    },
    {
      "nombre": "Saludable",
      "imagen": "mejoralimentos.jpg",
      "descripcion": "Abdomen alto..."
    },
    {
      "nombre": "¿Te apuntas?",
      "imagen": "peso.jpg",
      "descripcion": "Trabajo pesas de 5kg"
    },
  ];

  _listado() async {
    for (var i = 0; i < arreglox.length; i++) {
      final arregloxyz = arreglox[i];
      final String imagen = arregloxyz["imagen"];

      listamos.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new Hero(
                tag: arregloxyz['nombre'],
                child: new Material(
                  child: new InkWell(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detalle(
                          nombre: arregloxyz['nombre'],
                          imagen: imagen,
                          descripcion: arregloxyz['descripcion']),
                    )),
                    child: new Image.asset("img/$imagen", fit: BoxFit.contain),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(3.0),
              ),
              new Text(
                arregloxyz['nombre'],
                style: new TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    _listado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text(
            'Home',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                fontSize: 32,
                color: Color(0xFF5F44A3)),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,

//Boton para desloguearte
        //actions: <Widget>[
        // IconButton(
        // icon: Icon(Icons.exit_to_app),
        //onPressed: () {
        //BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
        //},
        //)
        //],
      ),
      body: new GridView.count(
        primary: false,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(15),
        crossAxisCount: 2, //numero de columas de la primera pagina pruebn con 1
        mainAxisSpacing: 10, //espacio entre card
        childAspectRatio: 1.300, //espacio largo de cada card
        children: listamos,
      ),
    );
  }
}

//creamos el metodo detalle
//este se usa cuando pulsamos para ver segunda pantalla la descripcion del ejercicio
class Detalle extends StatelessWidget {
  Detalle({this.nombre, this.imagen, this.descripcion});
  final String nombre;
  final String imagen;
  final String descripcion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 337.0, //tamaño de la segunda imagen
              child: new Hero(
                tag: nombre,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "img/$imagen",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          new IniciarNombre(
            nombre: nombre,
          ),
          new IniciarIcon(),
          new Informacion(
            descripcion: descripcion,
          ),
        ],
      ),
    );
  }
}

class IniciarNombre extends StatelessWidget {
  IniciarNombre({this.nombre});
  final String nombre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(15.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nombre,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  "Hola",
                  style: new TextStyle(fontSize: 15.0, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IniciarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new IconTec(icon: Icons.call, tec: "Llamar"),
          new IconTec(icon: Icons.message, tec: "WhastApp"),
          new IconTec(icon: Icons.photo, tec: "Foto"),
        ],
      ),
    );
  }
}

class IconTec extends StatelessWidget {
  IconTec({this.icon, this.tec});
  final IconData icon;
  final String tec;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            tec,
            style: new TextStyle(fontSize: 12.0, color: Colors.black),
          )
        ],
      ),
    );
  }
}

class Informacion extends StatelessWidget {
  Informacion({this.descripcion, this.imagen2});
  final String descripcion;
  final String imagen2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            descripcion,
            style: new TextStyle(fontSize: 30.0, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
