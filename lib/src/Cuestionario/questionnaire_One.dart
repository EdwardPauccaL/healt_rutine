import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:healt_rutine/src/questionnaire_others/hexcolor.dart';
import 'package:healt_rutine/src/questionnaire_others/questionnaire_tools.dart';
import 'questionnaire_Two.dart';

class QuestionnaireOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      body: QuestionnaireOneBody(),
    ));
  }
}

class QuestionnaireOneBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      QuestionnaireOneTitle(),
      QContainerOne(),
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
                return QuestionnaireTwo();
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

class QuestionnaireOneTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.fromLTRB(
              0.0, MediaQuery.of(context).size.height / 94, 0.0, 0.0)),
      PercentIndicator(0.0),
      Padding(
          padding: EdgeInsets.fromLTRB(
              0.0, MediaQuery.of(context).size.height / 36, 0.0, 0.0)),
      Align(
          alignment: Alignment(-0.90, 0.0),
          child: TitleText('Welcome to', HexColor("#000000"), FontWeight.bold,
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
        TitleText('Health Rutine', HexColor("#5f44a3"), FontWeight.bold,
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
                'Just a few questions to help you get set up with the app',
                HexColor("#b7b7b7"),
                FontWeight.normal,
                MediaQuery.of(context).size.height / 52),
          )),
    ]);
  }
}

class QContainerOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuestionnaireOneContainer();
  }
}

class QuestionnaireOneContainer extends State<QContainerOne> {
  bool maleON = true;
  bool femaleON = false;

  double currentAge = 0;
  double currentHeight = 0;
  double currentWeight = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(
            0.0, MediaQuery.of(context).size.height / 94, 0.0, 0.0),
        color: HexColor("#f4f4f4"),
        height: MediaQuery.of(context).size.height / 1.75,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          //Genre---------------------------------------------------------------
          Padding(
              padding: EdgeInsets.fromLTRB(0.0,
                  (MediaQuery.of(context).size.height / 1.75) / 20, 0.0, 0.0)),
          Row(children: [
            Padding(
                padding: EdgeInsets.fromLTRB(
                    (MediaQuery.of(context).size.width -
                            ((MediaQuery.of(context).size.width / 5) * 2)) /
                        3,
                    0.0,
                    0.0,
                    0.0)),
            Container(
                width: MediaQuery.of(context).size.width / 5,
                height: MediaQuery.of(context).size.height / 8,
                child: ButtonTheme(
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        //Male Button event--------------------------------------
                        onPressed: () {
                          setState(() {
                            if (!maleON) {
                              maleON = true;
                              femaleON = false;
                            }
                          });
                        },
                        //------------------------------------------------------------
                        color:
                            maleON ? HexColor('#cecece') : HexColor('#f4f4f4'),
                        child: Column(children: <Widget>[
                          Opacity(
                              opacity: maleON ? 1.0 : 0.5,
                              child: Image.asset('assets/mpng.png',
                                  width: MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 8)),
                        ])))),
            Padding(
                padding: EdgeInsets.fromLTRB(
                    (MediaQuery.of(context).size.width -
                            ((MediaQuery.of(context).size.width / 5) * 2)) /
                        3,
                    0.0,
                    0.0,
                    0.0)),
            Container(
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.height / 8,
              child: ButtonTheme(
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      //Male Button event--------------------------------------
                      onPressed: () {
                        setState(() {
                          if (!femaleON) {
                            femaleON = true;
                            maleON = false;
                          }
                        });
                      },
                      //------------------------------------------------------------
                      color:
                          femaleON ? HexColor('#cecece') : HexColor('#f4f4f4'),
                      child: Column(children: <Widget>[
                        Opacity(
                            opacity: femaleON ? 1.0 : 0.5,
                            child: Image.asset('assets/mpng.png',
                                width: MediaQuery.of(context).size.width / 5,
                                height:
                                    MediaQuery.of(context).size.height / 8)),
                      ]))),
            ),
          ]),
          //----------------------------------------------------------------------------------------------
          Padding(
              padding: EdgeInsets.fromLTRB(0.0,
                  (MediaQuery.of(context).size.height / 1.75) / 15, 0.0, 0.0)),
          //Age-------------------------------------------------------------------------------------------
          Align(
            alignment: Alignment(-0.9, 0.0),
            child: Text('Age: ' + (currentAge.toInt()).toString(),
                style: TextStyle(
                    color: HexColor('#000000'),
                    fontWeight: FontWeight.normal,
                    fontSize: MediaQuery.of(context).size.height / 52)),
          ),
          Slider(
              min: 0.00,
              max: 100.0,
              activeColor: HexColor('#bd3637'),
              inactiveColor: Colors.grey,
              value: currentAge,
              onChanged: (double newValue) {
                setState(() {
                  currentAge = newValue;
                });
              }),
          //----------------------------------------------------------------------------------------------
          Padding(
              padding: EdgeInsets.fromLTRB(0.0,
                  (MediaQuery.of(context).size.height / 1.75) / 15, 0.0, 0.0)),
          //Height-------------------------------------------------------------------------------------------
          Align(
            alignment: Alignment(-0.9, 0.0),
            child: Text('Height: ' + (currentHeight).toStringAsFixed(2) + ' m',
                style: TextStyle(
                    color: HexColor('#000000'),
                    fontWeight: FontWeight.normal,
                    fontSize: MediaQuery.of(context).size.height / 52)),
          ),
          Slider(
              min: 0.00,
              max: 3.0,
              activeColor: HexColor('#5f44a3'),
              inactiveColor: Colors.grey,
              value: currentHeight,
              onChanged: (double newValue) {
                setState(() {
                  currentHeight = newValue;
                });
              }),
          //----------------------------------------------------------------------------------------------
          Padding(
              padding: EdgeInsets.fromLTRB(0.0,
                  (MediaQuery.of(context).size.height / 1.75) / 15, 0.0, 0.0)),
          //Weight-------------------------------------------------------------------------------------------
          Align(
            alignment: Alignment(-0.9, 0.0),
            child: Text('Weight: ' + currentWeight.toStringAsFixed(1) + ' kg',
                style: TextStyle(
                    color: HexColor('#000000'),
                    fontWeight: FontWeight.normal,
                    fontSize: MediaQuery.of(context).size.height / 52)),
          ),
          Slider(
              min: 0.00,
              max: 700.0,
              activeColor: HexColor('#bd3637'),
              inactiveColor: Colors.grey,
              value: currentWeight,
              onChanged: (double newValue) {
                setState(() {
                  currentWeight = newValue;
                });
              }),
          //----------------------------------------------------------------------------------------------
        ]));
  }
}
