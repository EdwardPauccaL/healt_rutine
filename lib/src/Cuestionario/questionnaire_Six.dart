import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:healt_rutine/src/questionnaire_others/hexcolor.dart';
import 'package:healt_rutine/src/questionnaire_others/questionnaire_tools.dart';
import './questionnaire_Seven.dart';

class QuestionnaireSix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      body: QuestionnaireSixBody(),
    ));
  }
}

class QuestionnaireSixBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      QuestionnaireSixTitle(),
      QuestSixCont(),
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
                return QuestionnaireSeven();
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
      //----------------------------------------------------------------------------------------
    ]));
  }
}

class QuestionnaireSixTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.fromLTRB(
              0.0, MediaQuery.of(context).size.height / 94, 0.0, 0.0)),
      PercentIndicator(0.71),
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
        TitleText('eating habits', HexColor("#5f44a3"), FontWeight.bold,
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
                'Select all the options that match you',
                HexColor("#b7b7b7"),
                FontWeight.normal,
                MediaQuery.of(context).size.height / 52),
          )),
    ]);
  }
}

class QuestSixCont extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuestionnaireSixContainer();
  }
}

class QuestionnaireSixContainer extends State<QuestSixCont> {
  bool _optionOne = false;
  bool _optionTwo = false;
  bool _optionThree = false;
  bool _optionFour = false;
  bool _optionFive = false;
  bool _optionSix = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(
            0.0, /*10.0*/ MediaQuery.of(context).size.height / 94, 0.0, 0.0),
        color: HexColor("#f4f4f4"),
        height: MediaQuery.of(context).size.height / 1.75,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          //Moon & Salt----------------------------------------------------------------
          Expanded(
              flex: 1,
              child: Container(
                  width: double.infinity,
                  child: SingleChildScrollView(
                      child: Column(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            0.0,
                            ((MediaQuery.of(context).size.height / 1.75) -
                                    ((MediaQuery.of(context).size.height / 8) *
                                        3)) /
                                4,
                            0.0,
                            0.0)),
                    Row(children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              (MediaQuery.of(context).size.width -
                                      ((MediaQuery.of(context).size.width /
                                              3.5) *
                                          2)) /
                                  3,
                              0.0,
                              0.0,
                              0.0)),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: MediaQuery.of(context).size.height / 6,
                        child: ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width / 10,
                            height: MediaQuery.of(context).size.height / 8,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                //First Option Call---------------------------------------------
                                onPressed: () {
                                  setState(() {
                                    if (!_optionOne)
                                      _optionOne = true;
                                    else
                                      _optionOne = false;
                                  });
                                },
                                //----------------------------------------------------------------
                                color: _optionOne
                                    ? HexColor("#5f44a3")
                                    : HexColor("#f4f4f4"),
                                child: Column(children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                  Image.asset('assets/moonpng.png',
                                      width: MediaQuery.of(context).size.width /
                                          5.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              11),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                  Text('I dont get enough sleep',
                                      style: TextStyle(
                                          color: _optionOne
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70),
                                      textAlign: TextAlign.center),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                ]))),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              (MediaQuery.of(context).size.width -
                                      ((MediaQuery.of(context).size.width /
                                              3.5) *
                                          2)) /
                                  3,
                              0.0,
                              0.0,
                              0.0)),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: MediaQuery.of(context).size.height / 6,
                        child: ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width / 10,
                            height: MediaQuery.of(context).size.height / 8,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                //Second Option Call---------------------------------------------
                                onPressed: () {
                                  setState(() {
                                    if (!_optionTwo)
                                      _optionTwo = true;
                                    else
                                      _optionTwo = false;
                                  });
                                },
                                //----------------------------------------------------------------
                                color: _optionTwo
                                    ? HexColor("#5f44a3")
                                    : HexColor("#f4f4f4"),
                                child: Column(children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                  Image.asset('assets/saltpng.png',
                                      width: MediaQuery.of(context).size.width /
                                          5.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              11),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                  Text('I usually eat salt',
                                      style: TextStyle(
                                          color: _optionTwo
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70),
                                      textAlign: TextAlign.center),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                ]))),
                      ),
                    ]),
                    //---------------------------------------------------------------------------------------------------
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            0.0,
                            ((MediaQuery.of(context).size.height / 1.75) -
                                    ((MediaQuery.of(context).size.height / 8) *
                                        3)) /
                                4,
                            0.0,
                            0.0)),
                    //Sandwich & Soda------------------------------------------------------------------------------------
                    Row(children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              (MediaQuery.of(context).size.width -
                                      ((MediaQuery.of(context).size.width /
                                              3.5) *
                                          2)) /
                                  3,
                              0.0,
                              0.0,
                              0.0)),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: MediaQuery.of(context).size.height / 6,
                        child: ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width / 10,
                            height: MediaQuery.of(context).size.height / 8,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                //Third Option Call---------------------------------------------
                                onPressed: () {
                                  setState(() {
                                    if (!_optionThree)
                                      _optionThree = true;
                                    else
                                      _optionThree = false;
                                  });
                                },
                                //----------------------------------------------------------------
                                color: _optionThree
                                    ? HexColor("#5f44a3")
                                    : HexColor("#f4f4f4"),
                                child: Column(children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                  Image.asset('assets/sandwichpng.png',
                                      width: MediaQuery.of(context).size.width /
                                          5.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              11),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                  Text('I eat very late at night',
                                      style: TextStyle(
                                          color: _optionThree
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70),
                                      textAlign: TextAlign.center),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                ]))),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              (MediaQuery.of(context).size.width -
                                      ((MediaQuery.of(context).size.width /
                                              3.5) *
                                          2)) /
                                  3,
                              0.0,
                              0.0,
                              0.0)),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: MediaQuery.of(context).size.height / 6,
                        child: ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width / 10,
                            height: MediaQuery.of(context).size.height / 8,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                //Fourth Option Call---------------------------------------------
                                onPressed: () {
                                  setState(() {
                                    if (!_optionFour)
                                      _optionFour = true;
                                    else
                                      _optionFour = false;
                                  });
                                },
                                //----------------------------------------------------------------
                                color: _optionFour
                                    ? HexColor("#5f44a3")
                                    : HexColor("#f4f4f4"),
                                child: Column(children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                  Image.asset('assets/sodapng.png',
                                      width: MediaQuery.of(context).size.width /
                                          5.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              11),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                  Text('I love sodas',
                                      style: TextStyle(
                                          color: _optionFour
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70),
                                      textAlign: TextAlign.center),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                ]))),
                      ),
                    ]),
                    //---------------------------------------------------------------------------
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            0.0,
                            ((MediaQuery.of(context).size.height / 1.75) -
                                    ((MediaQuery.of(context).size.height / 8) *
                                        3)) /
                                4,
                            0.0,
                            0.0)),
                    //Cake & Chicken leg---------------------------------------------------------------
                    Row(children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              (MediaQuery.of(context).size.width -
                                      ((MediaQuery.of(context).size.width /
                                              3.5) *
                                          2)) /
                                  3,
                              0.0,
                              0.0,
                              0.0)),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: MediaQuery.of(context).size.height / 6,
                        child: ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width / 10,
                            height: MediaQuery.of(context).size.height / 8,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                //Fifth Option Call---------------------------------------------
                                onPressed: () {
                                  setState(() {
                                    if (!_optionFive)
                                      _optionFive = true;
                                    else
                                      _optionFive = false;
                                  });
                                },
                                //----------------------------------------------------------------
                                color: _optionFive
                                    ? HexColor("#5f44a3")
                                    : HexColor("#f4f4f4"),
                                child: Column(children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                  Image.asset('assets/cakepng.png',
                                      width: MediaQuery.of(context).size.width /
                                          5.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              11),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                  Text('Cant stop eating sweets',
                                      style: TextStyle(
                                          color: _optionFive
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70),
                                      textAlign: TextAlign.center),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                ]))),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              (MediaQuery.of(context).size.width -
                                      ((MediaQuery.of(context).size.width /
                                              3.5) *
                                          2)) /
                                  3,
                              0.0,
                              0.0,
                              0.0)),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: MediaQuery.of(context).size.height / 6,
                        child: ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width / 10,
                            height: MediaQuery.of(context).size.height / 8,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                //Sixth Option Call---------------------------------------------
                                onPressed: () {
                                  setState(() {
                                    if (!_optionSix)
                                      _optionSix = true;
                                    else
                                      _optionSix = false;
                                  });
                                },
                                //----------------------------------------------------------------
                                color: _optionSix
                                    ? HexColor("#5f44a3")
                                    : HexColor("#f4f4f4"),
                                child: Column(children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                  Image.asset('assets/chickenlegpng.png',
                                      width: MediaQuery.of(context).size.width /
                                          5.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              11),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                  Text('I love eating fried foods',
                                      style: TextStyle(
                                          color: _optionSix
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              70),
                                      textAlign: TextAlign.center),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0,
                                          ((MediaQuery.of(context).size.height /
                                                      6) -
                                                  120) /
                                              3,
                                          0.0,
                                          0.0)),
                                ]))),
                      ),
                    ]),
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            0.0,
                            ((MediaQuery.of(context).size.height / 1.75) -
                                    ((MediaQuery.of(context).size.height / 8) *
                                        3)) /
                                4,
                            0.0,
                            0.0)),
                  ])))),
        ]));
  }
}
