import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:healt_rutine/HexColor.dart';

import 'package:healt_rutine/src/pages/dietasrec.dart';
import 'package:healt_rutine/src/ingredient/ingredients/milk.dart';
import 'package:healt_rutine/src/ingredient/ingredients/egg.dart';
import 'package:healt_rutine/src/ingredient/ingredients/tomato.dart';

class Ingredient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      body: IngredientBody(),
    ));
  }
}

class IngredientBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IngredientBodyContent(),
    );
  }
}

class IngredientBodyContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IngredientBodyContainer();
  }
}

class IngredientBodyContainer extends State<IngredientBodyContent> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    /*List<Widget> _ingredients = new List.generate(_count, (int i) 
    => IngredientDataContainer('s', 's', 2.toString(), 1.toString(), 3.toString()));*/

    return Container(
        color: HexColor("#f4f4f4"),
        height: double.infinity,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: <Widget>[
              Row(children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(),
                ),
                ButtonTheme(
                    minWidth: (MediaQuery.of(context).size.width / 3.5) / 3,
                    height: MediaQuery.of(context).size.height / 20,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DietasRec(),
                            ));
                      },
                      shape: CircleBorder(),
                      child: Text('Done',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  (MediaQuery.of(context).size.height) / 50)),
                      color: HexColor("#5f44a3"),
                    )),
              ]),
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.height / 50,
                      MediaQuery.of(context).size.height / 50,
                      0.0,
                      0.0)),
              Row(children: <Widget>[
                Text('Total Cal: ',
                    style: TextStyle(
                        color: HexColor("#000000"),
                        fontSize: MediaQuery.of(context).size.height / 60)),
                Text('100g | ',
                    style: TextStyle(
                        color: HexColor("#5f44a3"),
                        fontSize: MediaQuery.of(context).size.height / 60)),
                Text('200g',
                    style: TextStyle(
                        color: HexColor("#5f44a3"),
                        fontSize: MediaQuery.of(context).size.height / 60)),
              ]),
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.height / 50,
                      MediaQuery.of(context).size.height / 50,
                      0.0,
                      0.0)),
              Row(children: <Widget>[
                Text('Total Proteins: ',
                    style: TextStyle(
                        color: HexColor("#000000"),
                        fontSize: MediaQuery.of(context).size.height / 60)),
                Text('400g | ',
                    style: TextStyle(
                        color: HexColor("#5f44a3"),
                        fontSize: MediaQuery.of(context).size.height / 60)),
                Text('400g',
                    style: TextStyle(
                        color: HexColor("#5f44a3"),
                        fontSize: MediaQuery.of(context).size.height / 60)),
              ]),
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      0.0, MediaQuery.of(context).size.height / 50, 0.0, 0.0)),
              IngredientDataContainer(
                  Milk().icon,
                  Milk().name,
                  Milk().calories.toString(),
                  Milk().etc.toString(),
                  Milk().proteins.toString() + 'min'),
              IngredientDataContainer(
                  Egg().icon,
                  Egg().name,
                  Egg().calories.toString(),
                  Egg().etc.toString(),
                  Egg().proteins.toString() + 'min'),
              IngredientDataContainer(
                  Tomato().icon,
                  Tomato().name,
                  Tomato().calories.toString(),
                  Tomato().etc.toString(),
                  Tomato().proteins.toString() + 'min'),
              /*Container(
                width: MediaQuery.of(context).size.width,
                child: ListView(children: _ingredients)
              ),*/
              /*ButtonTheme(
                    minWidth: (MediaQuery.of(context).size.width / 3.5) / 3,
                    height: MediaQuery.of(context).size.height / 20,
                    child: RaisedButton(
                      onPressed: () {
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Ingredient(),
                            ));*/
                      },
                      shape: CircleBorder(),
                      child: Text('+',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  (MediaQuery.of(context).size.height) / 20)),
                      color: HexColor("#5f44a3"),
                    )),*/
            ])));
  }

  void _addNewIngredient() {
    setState(() {
      _count += 1;
    });
  }
}

class IngredientDataContainer extends StatelessWidget {
  final String icon;
  final String name;
  final String calories;
  final String etc;
  final String protein;

  IngredientDataContainer(
      this.icon, this.name, this.calories, this.etc, this.protein);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(
            0.0, MediaQuery.of(context).size.height / 50, 0.0, 0.0),
        width: MediaQuery.of(context).size.width -
            (MediaQuery.of(context).size.width / 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: HexColor("#ffffff"),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Column(children: <Widget>[
          Container(
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.height / 50,
                        0.0,
                        0.0,
                        0.0)),
                Image.asset(icon,
                    width: MediaQuery.of(context).size.width / 10,
                    height: MediaQuery.of(context).size.height / 10),
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.height / 50,
                        0.0,
                        0.0,
                        0.0)),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
                  Text(name,
                      style: TextStyle(
                          color: HexColor("#5f44a3"),
                          fontSize: MediaQuery.of(context).size.height / 60)),
                  Row(children: <Widget>[
                    Text('Cal:' + calories,
                        style: TextStyle(
                            color: HexColor("#b9b9b9"),
                            fontSize: MediaQuery.of(context).size.height / 60)),
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.height / 50,
                            0.0,
                            0.0,
                            0.0)),
                    Text('Etc: ' + etc,
                        style: TextStyle(
                            color: HexColor("#b9b9b9"),
                            fontSize: MediaQuery.of(context).size.height / 60)),
                  ]),
                  Text('Proteins: ' + protein,
                      style: TextStyle(
                          color: HexColor("#b9b9b9"),
                          fontSize: MediaQuery.of(context).size.height / 60)),
                ]),
              ]),
            ]),
          ),
        ]));
  }
}

/*class ObtainedIngredient
{
  String icon = 'assets/mpng.png';
  String name = 'Tomato';
  int calories = 20;
  int etc = 1;
  int proteins = 3;

  void set setIcon(String icon)
  {
    this.icon = icon;
  }

  void set setName(String name)
  {
    this.name = name;
  }

  void set setCalories(int calories)
  {
    this.calories = calories;
  }

  void set setEtc(int etc)
  {
    this.etc = etc;
  }

  void set setProteins(int proteins)
  {
    this.proteins = proteins;
  }
}*/
