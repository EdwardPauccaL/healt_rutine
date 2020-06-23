import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
  final String name;
  Home({Key key,@required this.name}) :  super(key: key);
  
}

class _HomeState extends State<Home> {

  //creamos un arreglo de datos imagenes y nombre ejercicio
  List<Container> listamos = List();


  var arreglox = [
    {"nombre": "Brazos", "imagen": "pesasHR.png", "deporte": "Trabajo con polea 4 repiticiones de 12","descripcion": "Number of reps: 20       Number of series: 1Estimated time: 3 min"},
    {"nombre": "Peso muerto/Deadlift", "imagen": "deadliftHR.png", "deporte": "Trabajo con pesas....","descripcion": "Pierna"},
    {"nombre": "Bench press", "imagen": "BenchHR.png", "deporte": "Trabajo con cinta 4 repeticiones de 15","descripcion": "Pierna"},
    {"nombre": "Cinta", "imagen": "cinta2.jpg", "deporte": "Trabajo con cinta 2 repeticiones de 15","descripcion": "Pierna"},
    {"nombre": "Abdomen", "imagen": "abdomen2.jpg", "deporte": "Abdomen alto...","descripcion": "Pierna"},
    {"nombre": "Peso", "imagen": "peso.jpg", "deporte": "Trabajo pesas de 5kg","descripcion": "Pierna"},
    {"nombre": "Pierna + Gluteos", "imagen": "pierna2.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15","descripcion": "Pierna"},
    {"nombre": "Gluteos", "imagen": "gluteos.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15","descripcion": "Pierna"},
    {"nombre": "Mas Gluteos", "imagen": "gluteos2.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15","descripcion": "Pierna"},
    {"nombre": "Pierna..", "imagen": "pierna.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15","descripcion": "Pierna"},
    {"nombre": "Barra", "imagen": "barra2.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15","descripcion": "Pierna"},
    {"nombre": "Rusa", "imagen": "rusa.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15","descripcion": "Pierna"},
    {"nombre": "Pierna..", "imagen": "pierna3.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15","descripcion": "Pierna"},
    {"nombre": "Cinta Elastica", "imagen": "cinta2.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15","descripcion": "Pierna"},
    {"nombre": "Peso z", "imagen": "peso2.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15","descripcion": "Pierna"},
    {"nombre": "Mancuernas", "imagen": "mancuernas.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15","descripcion": "Pierna"},
    {"nombre": "Estiramiento", "imagen": "estiramiento.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15","descripcion": "Pierna"},
    {"nombre": "Otro", "imagen": "otro.png", "deporte": "Fortalece pierna y Gluteos","descripcion": "Pierna"},
    {"nombre": "Otro+", "imagen": "otro1.png", "deporte": "pierna y Gluteos","descripcion": "Pierna"},
    {"nombre": "mas Ejercicio", "imagen": "pierna5.png", "deporte": "Fortalece pierna y Gluteos","descripcion": "Pierna"},
    {"nombre": "barra de 5k", "imagen": "barra.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15","descripcion": "Pierna"},
  ];


  _listado() async {
    for (var i = 0; i < arreglox.length; i++) {
      final arregloxyz = arreglox[i];
      final String imagen = arregloxyz["imagen"];
     

      listamos.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          elevation: 8,
          child: new Column(
            children: <Widget>[
              new Text(
                arregloxyz['nombre'],
                style: new TextStyle(fontSize: 20.0),
              ),
              new Hero(
                tag: arregloxyz['nombre'],
                child: new Material(
                  child: new InkWell(
                    onTap: () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detalle(
                        nombre: arregloxyz['nombre'],
                        imagen: imagen,
                        deporte: arregloxyz['deporte']
                      ),
                    )),
                    child: Container(
                      width: 300,
                      height: 150,
                      child:Align(
                        alignment: Alignment.centerLeft,
                      child:new Container(
                            width: 150,
                              alignment: Alignment(-1, 0),
                            child: new Image.asset(
                            "img/$imagen",
                              fit: BoxFit.fill, 
                              ),
                          )
                      ),

                    )
                  ),
                ),
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
           body: new Container(
         decoration: BoxDecoration(
           border:Border.all(width:3,color:Colors.red,)
         ),
         child:  ListView(
           shrinkWrap: true,
           children: listamos,
         ),
        ),
          
    );
  }
}

//creamos el metodo detalle
//este se usa cuando pulsamos para ver segunda pantalla la descripcion del ejercicio
class Detalle extends StatelessWidget {
   Detalle({this.nombre, this.imagen, this.deporte});
  final String nombre;
  final String imagen;
  final String deporte;


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: new ListView(
          children: <Widget>[
            new Container(
              height: 387.0,//tamaño de la segunda imagen
              child: new Hero(
                tag: nombre,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "img/$imagen",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )),
              new IniciarNombre(
                nombre: nombre,
              ),
              new IniciarIcon(),
              new Informacion(
                deporte: deporte,
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
                  "$nombre\@gmail.com",
                  style: new TextStyle(fontSize: 15.0, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(//icono que agrega estrellas calificacion
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.orange,
              ),
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.purple,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          )
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
          new IconTec(
            icon: Icons.call,
            tec: "Llamar"
                ), 
                new IconTec(
            icon: Icons.message,
            tec: "WhastApp"
                ),
                new IconTec(
            icon: Icons.photo,
            tec: "Foto"
                ),
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
            style: new TextStyle(fontSize: 12.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class Informacion extends StatelessWidget {
  Informacion({this.deporte});
  final String deporte;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            deporte,
            style: new TextStyle(fontSize: 16.0, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}