import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:healt_rutine/HexColor.dart';
import 'package:healt_rutine/src/meal/breakfast.dart';
import 'package:healt_rutine/src/meal/lunch.dart';
import 'package:healt_rutine/src/meal/dinner.dart';

class DietasRec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      body: FoodBody(),
    ));
  }
}

class FoodBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FoodBodyContent(),
    );
  }
}

class FoodBodyContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FoodBodyContainer();
  }
}

class FoodBodyContainer extends State<FoodBodyContent> {
  bool bfSelected = false;
  bool lunchSelected = false;
  bool dinnerSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: HexColor("#f4f4f4"),
        height: double.infinity,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: <Widget>[
              Row(children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.height / 80,
                        0.0,
                        0.0,
                        0.0)),
                Text('Enjoy your ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height / 30)),
                Text('Meal',
                    style: TextStyle(
                        color: HexColor("#5f44a3"),
                        fontSize: MediaQuery.of(context).size.height / 30)),
              ]),
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      0.0, MediaQuery.of(context).size.height / 50, 0.0, 0.0)),
              BreakfastContent(),
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      0.0, MediaQuery.of(context).size.height / 15, 0.0, 0.0)),
              LunchContent(),
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      0.0, MediaQuery.of(context).size.height / 15, 0.0, 0.0)),
              DinnerContent(),
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      0.0, MediaQuery.of(context).size.height / 15, 0.0, 0.0)),
            ])));
  }
}
