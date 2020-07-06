import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:healt_rutine/src/questionnaire_others/hexcolor.dart';
import 'package:healt_rutine/src/questionnaire_others/questionnaire_tools.dart';
import './questionnaire_Five.dart';

class QuestionnaireFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      body: QuestionnaireFourBody(),
    ));
  }
}

class QuestionnaireFourBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      QuestionnaireFourTitle(),
      QuestFourCont(),
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
                return QuestionnaireFive();
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
      //--------------------------------------------------------------------------------------------
    ]));
  }
}

class QuestionnaireFourTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.fromLTRB(
              0.0, MediaQuery.of(context).size.height / 94, 0.0, 0.0)),
      PercentIndicator(0.42),
      Padding(
          padding: EdgeInsets.fromLTRB(
              0.0, MediaQuery.of(context).size.height / 36, 0.0, 0.0)),
      Align(
          alignment: Alignment(-0.90, 0.0),
          child: TitleText('Describe your diary', HexColor("#000000"),
              FontWeight.bold, MediaQuery.of(context).size.height / 26)),
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
        TitleText('routine', HexColor("#5f44a3"), FontWeight.bold,
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
                'The focus depends on your current lifestyle',
                HexColor("#b7b7b7"),
                FontWeight.normal,
                /*18.0*/ MediaQuery.of(context).size.height / 52),
          )),
    ]);
  }
}

class QuestFourCont extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuestionnaireFourContainer();
  }
}

class QuestionnaireFourContainer extends State<QuestFourCont> {
  bool _option_one = true;

  bool _option_two = false;

  bool _option_three = false;

  bool _option_four = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          ((MediaQuery.of(context).size.height / 7) * 2)) /
                      3,
                  0.0,
                  0.0)),
          Row(children: [
            Padding(
                padding: EdgeInsets.fromLTRB(
                    (MediaQuery.of(context).size.width -
                            ((MediaQuery.of(context).size.width / 3.5) * 2)) /
                        3,
                    0.0,
                    0.0,
                    0.0)),
            Container(
              width: MediaQuery.of(context).size.width / 3.5,
              height: MediaQuery.of(context).size.height / 7,
              child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width / 10,
                  height: MediaQuery.of(context).size.height / 7,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      //Primera Opcion evento------------------------------------------------------------------------------------------
                      onPressed: () {
                        setState(() {
                          if (!_option_one) _option_one = true;
                          _option_two = false;
                          _option_three = false;
                          _option_four = false;
                        });
                      },
                      //---------------------------------------------------------------------------------------------------------------------
                      color: _option_one
                          ? HexColor("#5f44a3")
                          : HexColor("#f4f4f4"),
                      child: Column(children: <Widget>[
                        Image.asset('assets/mpng.png',
                            width: MediaQuery.of(context).size.width / 5.5,
                            height: MediaQuery.of(context).size.height / 10.5),
                        Text('Physical Work',
                            style: TextStyle(
                                color: _option_one
                                    ? HexColor('#ffffff')
                                    : HexColor("#000000"),
                                fontSize:
                                    MediaQuery.of(context).size.height / 70)),
                      ]))),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(
                    (MediaQuery.of(context).size.width -
                            ((MediaQuery.of(context).size.width / 3.5) * 2)) /
                        3,
                    0.0,
                    0.0,
                    0.0)),
            Container(
              width: MediaQuery.of(context).size.width / 3.5,
              height: MediaQuery.of(context).size.height / 7,
              child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width / 10,
                  height: MediaQuery.of(context).size.height / 7,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      //Segunda Opcion evento------------------------------------------------------------------------------------------
                      onPressed: () {
                        setState(() {
                          if (!_option_two) _option_two = true;
                          _option_one = false;
                          _option_three = false;
                          _option_four = false;
                        });
                      },
                      //---------------------------------------------------------------------------------------------------------------------
                      color: _option_two
                          ? HexColor("#5f44a3")
                          : HexColor("#f4f4f4"),
                      child: Column(children: <Widget>[
                        Image.asset('assets/mpng.png',
                            width: MediaQuery.of(context).size.width / 5.5,
                            height: MediaQuery.of(context).size.height / 10.5),
                        Text('Mostly at Home',
                            style: TextStyle(
                                color: _option_two
                                    ? HexColor('#ffffff')
                                    : HexColor("#000000"),
                                fontSize:
                                    MediaQuery.of(context).size.height / 70)),
                      ]))),
            ),
          ]),
          Padding(
              padding: EdgeInsets.fromLTRB(
                  0.0,
                  ((MediaQuery.of(context).size.height / 1.75) -
                          ((MediaQuery.of(context).size.height / 7) * 2)) /
                      3,
                  0.0,
                  0.0)),
          Row(children: [
            Padding(
                padding: EdgeInsets.fromLTRB(
                    (MediaQuery.of(context).size.width -
                            ((MediaQuery.of(context).size.width / 3.5) * 2)) /
                        3,
                    0.0,
                    0.0,
                    0.0)),
            Container(
              width: MediaQuery.of(context).size.width / 3.5,
              height: MediaQuery.of(context).size.height / 7,
              child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width / 10,
                  height: MediaQuery.of(context).size.height / 7,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      //Tercera Opcion evento------------------------------------------------------------------------------------------
                      onPressed: () {
                        setState(() {
                          if (!_option_three) _option_three = true;
                          _option_one = false;
                          _option_two = false;
                          _option_four = false;
                        });
                      },
                      //---------------------------------------------------------------------------------------------------------------------
                      color: _option_three
                          ? HexColor("#5f44a3")
                          : HexColor("#f4f4f4"),
                      child: Column(children: <Widget>[
                        Image.asset('assets/mpng.png',
                            width: MediaQuery.of(context).size.width / 5.5,
                            height: MediaQuery.of(context).size.height / 10.5),
                        Text('Daily Walk',
                            style: TextStyle(
                                color: _option_three
                                    ? HexColor('#ffffff')
                                    : HexColor("#000000"),
                                fontSize:
                                    MediaQuery.of(context).size.height / 70)),
                      ]))),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(
                    (MediaQuery.of(context).size.width -
                            ((MediaQuery.of(context).size.width / 3.5) * 2)) /
                        3,
                    0.0,
                    0.0,
                    0.0)),
            Container(
              width: MediaQuery.of(context).size.width / 3.5,
              height: MediaQuery.of(context).size.height / 7,
              child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width / 10,
                  height: MediaQuery.of(context).size.height / 7,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      //Cuarta Opcion evento------------------------------------------------------------------------------------------
                      onPressed: () {
                        setState(() {
                          if (!_option_four) _option_four = true;
                          _option_one = false;
                          _option_three = false;
                          _option_two = false;
                        });
                      },
                      //---------------------------------------------------------------------------------------------------------------------
                      color: _option_four
                          ? HexColor("#5f44a3")
                          : HexColor("#f4f4f4"),
                      child: Column(children: <Widget>[
                        Image.asset('assets/mpng.png',
                            width: MediaQuery.of(context).size.width / 5.5,
                            height: MediaQuery.of(context).size.height / 10.5),
                        Text('All day at office',
                            style: TextStyle(
                                color: _option_four
                                    ? HexColor('#ffffff')
                                    : HexColor("#000000"),
                                fontSize:
                                    MediaQuery.of(context).size.height / 70)),
                      ]))),
            ),
          ]),
        ]));
  }
}

/*ButtonTheme(
              minWidth: MediaQuery.of(context).size.width / 10,
              height: MediaQuery.of(context).size.height / 8,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                    if (!Option1) {}
                  },
                  color: HexColor("#f4f4f4"),
                  child: Column(
                    children: <Widget>[
                    Image.asset('assets/mpng.png', width:40, height:38),
                    Text('Physical Work', style: TextStyle(color: Colors.black)),
        ]))),*/
