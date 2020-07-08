import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:healt_rutine/HexColor.dart';
import 'package:healt_rutine/src/ingredient/ingredient.dart';

class LunchContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LunchContainer();
  }
}

class LunchContainer extends State<LunchContent> {
  bool lunchSelected = false;
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
          GestureDetector(
              onTap: () {
                setState(() {
                  lunchSelected ? lunchSelected = false : lunchSelected = true;
                });
              },
              child: Container(
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.height / 50,
                            0.0,
                            0.0,
                            0.0)),
                    Image.asset('assets/mpng.png',
                        width: MediaQuery.of(context).size.width / 10,
                        height: MediaQuery.of(context).size.height / 10),
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.height / 50,
                            0.0,
                            0.0,
                            0.0)),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Lunch',
                              style: TextStyle(
                                  color: HexColor("#5f44a3"),
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60)),
                          Row(children: <Widget>[
                            Text('From: 12:00 pm',
                                style: TextStyle(
                                    color: HexColor("#b9b9b9"),
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            60)),
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.height / 50,
                                    0.0,
                                    0.0,
                                    0.0)),
                            Text('To: 2:00 pm',
                                style: TextStyle(
                                    color: HexColor("#b9b9b9"),
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            60)),
                          ]),
                          Text('Number of Option: 3',
                              style: TextStyle(
                                  color: HexColor("#b9b9b9"),
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60)),
                        ]),
                  ]),
                  Visibility(
                      child: Container(
                        child: Column(children: <Widget>[
                          Row(children: <Widget>[
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.height / 50,
                                    0.0,
                                    0.0,
                                    0.0)),
                            Text('Option 1',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            60)),
                          ]),
                          Row(children: <Widget>[
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.height / 50,
                                    0.0,
                                    0.0,
                                    0.0)),
                            Text('2 Eggs',
                                style: TextStyle(
                                    color: HexColor("#b9b9b9"),
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            60)),
                            Text('1 Bread',
                                style: TextStyle(
                                    color: HexColor("#b9b9b9"),
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            60)),
                            Text('1 Juice',
                                style: TextStyle(
                                    color: HexColor("#b9b9b9"),
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            60)),
                          ]),
                          Row(children: <Widget>[
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.height / 50,
                                    0.0,
                                    0.0,
                                    0.0)),
                            Text('Total Cal: 100g',
                                style: TextStyle(
                                    color: HexColor("#b9b9b9"),
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            60)),
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.height / 50,
                                    0.0,
                                    0.0,
                                    0.0)),
                            Text('Total Proteins: 400g',
                                style: TextStyle(
                                    color: HexColor("#b9b9b9"),
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            60)),
                          ]),
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0.0,
                                  MediaQuery.of(context).size.height / 50,
                                  0.0,
                                  0.0)),
                          ButtonTheme(
                              minWidth:
                                  (MediaQuery.of(context).size.width / 3.5) / 3,
                              height: MediaQuery.of(context).size.height / 20,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Ingredient(),
                                      ));
                                },
                                shape: CircleBorder(),
                                child: Text('+',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: (MediaQuery.of(context)
                                                .size
                                                .height) /
                                            20)),
                                color: HexColor("#5f44a3"),
                              )),
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0.0,
                                  MediaQuery.of(context).size.height / 50,
                                  0.0,
                                  0.0)),
                        ]),
                      ),
                      visible: lunchSelected),
                ]),
              )),
        ]));
  }
}
