import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:healt_rutine/src/questionnaire_others/hexcolor.dart';
import 'package:healt_rutine/src/questionnaire_others/questionnaire_tools.dart';
import './questionnaire_Six.dart';

class QuestionnaireFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      body: QuestionnaireFiveBody(),
    ));
  }
}

class QuestionnaireFiveBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      QuestionnaireFiveTitle(),
      QuestFiveCont(),
      Padding(
          padding: EdgeInsets.fromLTRB(
              0.0,
              ((MediaQuery.of(context).size.height / 1.75) -
                      ((MediaQuery.of(context).size.height / 14) * 4)) /
                  5,
              0.0,
              0.0)),
      //Button Next--------------------------------------------------------------------------
      ButtonTheme(
          minWidth: MediaQuery.of(context).size.width / 3.5,
          height: MediaQuery.of(context).size.height / 20,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return QuestionnaireSix();
              }));
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text('Next',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 40)),
            color: HexColor("#5f44a3"),
          )),
      //---------------------------------------------------------------------------------------
    ]));
  }
}

class QuestionnaireFiveTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.fromLTRB(
              0.0, MediaQuery.of(context).size.height / 94, 0.0, 0.0)),
      PercentIndicator(0.57),
      Padding(
          padding: EdgeInsets.fromLTRB(
              0.0, MediaQuery.of(context).size.height / 36, 0.0, 0.0)),
      Align(
          alignment: Alignment(-0.90, 0.0),
          child: TitleText('What is your', HexColor("#000000"), FontWeight.bold,
              MediaQuery.of(context).size.height / 26)),
      Row(children: [
        Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width / 40, 0.0, 0.0, 0.0)),
        Image.asset('assets/mpng.png',
            width: MediaQuery.of(context).size.width / 12,
            height: MediaQuery.of(context).size.height / 26),
        Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width / 50, 0.0, 0.0, 0.0)),
        TitleText('activity level', HexColor("#5f44a3"), FontWeight.bold,
            MediaQuery.of(context).size.height / 26),
      ]),
      Padding(
          padding: EdgeInsets.fromLTRB(
              0.0, MediaQuery.of(context).size.height / 94, 0.0, 0.0)),
      Align(
          alignment: Alignment(-0.90, 0.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height / 19,
            child: TitleText(
                'Its importat to consider your current physical form',
                HexColor("#b7b7b7"),
                FontWeight.normal,
                MediaQuery.of(context).size.height / 52),
          )),
    ]);
  }
}

class QuestFiveCont extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuestionnaireFiveContainer();
  }
}

class QuestionnaireFiveContainer extends State<QuestFiveCont> {
  bool Option1 = true;

  bool Option2 = false;

  bool Option3 = false;

  bool Option4 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
        margin: EdgeInsets.fromLTRB(
            0.0, MediaQuery.of(context).size.height / 94, 0.0, 0.0),
        color: HexColor("#f4f4f4"),
        height: MediaQuery.of(context).size.height / 1.75,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Padding(
              padding: EdgeInsets.fromLTRB(
                  0.0,
                  ((MediaQuery.of(context).size.height / 1.75) -
                          ((MediaQuery.of(context).size.height / 14) * 4)) /
                      5,
                  0.0,
                  0.0)),
          ButtonTheme(
              minWidth: MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width / 12),
              height: MediaQuery.of(context).size.height / 14,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  //Primer opcion evento------------------------------------------------------------------------------------
                  onPressed: () {
                    setState(() {
                      if (!Option1) {
                        Option1 = true;
                        Option2 = false;
                        Option3 = false;
                        Option4 = false;
                      }
                    });
                  },
                  //--------------------------------------------------------------------------------------------------------------
                  color: Option1 ? HexColor("#5f44a3") : HexColor("#FFFFFF"),
                  child: Row(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width / 20,
                            0.0,
                            0.0,
                            0.0)),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Almost nothing',
                              style: TextStyle(
                                  color: Option1
                                      ? HexColor("#FFFFFF")
                                      : Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60)),
                          Text('I have a sedentary life',
                              style: TextStyle(
                                  color: HexColor("#b9b9b9"),
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60)),
                        ])
                  ]))),
          Padding(
              padding: EdgeInsets.fromLTRB(
                  0.0,
                  ((MediaQuery.of(context).size.height / 1.75) -
                          ((MediaQuery.of(context).size.height / 14) * 4)) /
                      5,
                  0.0,
                  0.0)),
          ButtonTheme(
              minWidth: MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width / 12),
              height: MediaQuery.of(context).size.height / 14,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  //Segunda opcion evento------------------------------------------------------------------------------------
                  onPressed: () {
                    setState(() {
                      if (!Option2) {
                        Option2 = true;
                        Option1 = false;
                        Option3 = false;
                        Option4 = false;
                      }
                    });
                  },
                  //--------------------------------------------------------------------------------------------------------------
                  color: Option2 ? HexColor("#5f44a3") : HexColor("#FFFFFF"),
                  child: Row(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width / 20,
                            0.0,
                            0.0,
                            0.0)),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Just walk',
                              style: TextStyle(
                                  color: Option2
                                      ? HexColor("#FFFFFF")
                                      : Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60)),
                          Text('I like to walk sometimes',
                              style: TextStyle(
                                  color: HexColor("#b9b9b9"),
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60)),
                        ])
                  ]))),
          Padding(
              padding: EdgeInsets.fromLTRB(
                  0.0,
                  ((MediaQuery.of(context).size.height / 1.75) -
                          ((MediaQuery.of(context).size.height / 14) * 4)) /
                      5,
                  0.0,
                  0.0)),
          ButtonTheme(
              minWidth: MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width / 12),
              height: MediaQuery.of(context).size.height / 14,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  //Tercera opcion evento------------------------------------------------------------------------------------
                  onPressed: () {
                    setState(() {
                      if (!Option3) {
                        Option3 = true;
                        Option2 = false;
                        Option1 = false;
                        Option4 = false;
                      }
                    });
                  },
                  //--------------------------------------------------------------------------------------------------------------
                  color: Option3 ? HexColor("#5f44a3") : HexColor("#FFFFFF"),
                  child: Row(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width / 20,
                            0.0,
                            0.0,
                            0.0)),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('I train 1 - 2 times a week',
                              style: TextStyle(
                                  color: Option3
                                      ? HexColor("#FFFFFF")
                                      : Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60)),
                          Text('I take care of myself',
                              style: TextStyle(
                                  color: HexColor("#b9b9b9"),
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60)),
                        ])
                  ]))),
          Padding(
              padding: EdgeInsets.fromLTRB(
                  0.0,
                  ((MediaQuery.of(context).size.height / 1.75) -
                          ((MediaQuery.of(context).size.height / 14) * 4)) /
                      5,
                  0.0,
                  0.0)),
          ButtonTheme(
              minWidth: MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width / 12),
              height: MediaQuery.of(context).size.height / 14,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  //Cuarta opcion evento------------------------------------------------------------------------------------
                  onPressed: () {
                    setState(() {
                      if (!Option4) {
                        Option4 = true;
                        Option2 = false;
                        Option3 = false;
                        Option1 = false;
                      }
                    });
                  },
                  //--------------------------------------------------------------------------------------------------------------
                  color: Option4 ? HexColor("#5f44a3") : HexColor("#FFFFFF"),
                  child: Row(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width / 20,
                            0.0,
                            0.0,
                            0.0)),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('I train 3 - 4 times a week',
                              style: TextStyle(
                                  color: Option4
                                      ? HexColor("#FFFFFF")
                                      : Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60)),
                          Text('I m moderately active',
                              style: TextStyle(
                                  color: HexColor("#b9b9b9"),
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60)),
                        ])
                  ]))),
        ]));
  }
}
