import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:healt_rutine/src/questionnaire_others/hexcolor.dart';
import 'package:healt_rutine/src/questionnaire_others/questionnaire_tools.dart';
import './questionnaire_End.dart';

class QuestionnaireSeven extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      body: QuestionnaireSevenBody(),
    ));
  }
}

class QuestionnaireSevenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      QuestionnaireSevenTitle(),
      QuestSevenCont(),
    ]));
  }
}

class QuestionnaireSevenTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.fromLTRB(
              0.0, MediaQuery.of(context).size.height / 94, 0.0, 0.0)),
      PercentIndicator(0.85),
      Padding(
          padding: EdgeInsets.fromLTRB(
              0.0, MediaQuery.of(context).size.height / 36, 0.0, 0.0)),
      Align(
          alignment: Alignment(-0.90, 0.0),
          child: TitleText('Tell us about your', HexColor("#000000"),
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
        TitleText('free times', HexColor("#5f44a3"), FontWeight.bold,
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
                'Let us schedule your workouts in your free time',
                HexColor("#b7b7b7"),
                FontWeight.normal,
                MediaQuery.of(context).size.height / 52),
          )),
    ]);
  }
}

class QuestSevenCont extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuestionnaireSevenContainer();
  }
}

class QuestionnaireSevenContainer extends State<QuestSevenCont> {
  double fromTime = 0;
  String _fromTime = 'am';

  double toTime = 0;
  String _toTime = 'am';

  bool monON = false;
  bool tueON = false;
  bool wedON = false;
  bool thuON = false;
  bool friON = false;
  bool satON = false;
  bool sunON = false;

  bool itsON = true;
  bool cust2 = false;

  int _count = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> _customSchedule = new List.generate(_count,
        (int i) => CustomizedSchedule('Customized ' + _count.toString()));

    return Container(
        color: HexColor("#ffffff"),
        width: MediaQuery.of(context).size.width,
        child: Column(children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(
                  0.0, MediaQuery.of(context).size.height / 94, 0.0, 0.0),
              color: HexColor("#f4f4f4"),
              height: MediaQuery.of(context).size.height / 1.75,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(0.0,
                        MediaQuery.of(context).size.height / 20, 0.0, 0.0)),
                //Customs Buttons-----------------------------------------------------------------------------------
                Container(
                  height: MediaQuery.of(context).size.height / 18,
                  /*child: ListView(
                    children: _customSchedule,
                    scrollDirection: Axis.horizontal,
                  ),*/
                  child: _customSchedules(),
                ),
                //------------------------------------------------------------------------------------------
                Padding(
                    padding: EdgeInsets.fromLTRB(0.0,
                        MediaQuery.of(context).size.height / 20, 0.0, 0.0)),
                //From time set--------------------------------------------------------------------------------
                Align(
                  alignment: Alignment(-0.9, 0.0),
                  child: Text(
                      'From: ' +
                          (fromTime.toInt()).toString() +
                          ':00 ' +
                          _fromTime,
                      style: TextStyle(
                          color: HexColor('#000000'),
                          fontWeight: FontWeight.normal,
                          fontSize: MediaQuery.of(context).size.height / 47)),
                ),
                Slider(
                    min: 0.00,
                    max: 23.00,
                    activeColor: HexColor('#5f44a3'),
                    inactiveColor: Colors.grey,
                    value: fromTime,
                    onChanged: (double newValue) {
                      setState(() {
                        fromTime = newValue;
                        if (fromTime >= 12)
                          _fromTime = 'pm';
                        else
                          _fromTime = 'am';
                      });
                    }),
                //-------------------------------------------------------------------------------------------
                //To time set--------------------------------------------------------------------------------
                Align(
                  alignment: Alignment(-0.9, 0.0),
                  child: Text(
                      'To: ' + (toTime.toInt()).toString() + ':00 ' + _toTime,
                      style: TextStyle(
                          color: HexColor('#000000'),
                          fontWeight: FontWeight.normal,
                          fontSize: MediaQuery.of(context).size.height / 47)),
                ),
                Slider(
                    min: 0.00,
                    max: 23.00,
                    activeColor: HexColor('#bd3637'),
                    inactiveColor: Colors.grey,
                    value: toTime,
                    onChanged: (double newValue) {
                      setState(() {
                        toTime = newValue;
                        if (toTime >= 12)
                          _toTime = 'pm';
                        else
                          _toTime = 'am';
                      });
                    }),
                //-------------------------------------------------------------------------------------------------------------
                // Days of the Week-------------------------------------------------------------------------------------------
                Padding(
                    padding: EdgeInsets.fromLTRB(0.0,
                        MediaQuery.of(context).size.height / 20, 0.0, 0.0)),
                Align(
                    alignment: Alignment(-0.9, 0.0),
                    child: Text('Days of Week',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height / 47,
                            fontWeight: FontWeight.bold))),
                Expanded(
                    flex: 1,
                    child: Container(
                        width: double.infinity,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (MediaQuery.of(context).size.width / 5) /
                                          4,
                                      0.0,
                                      0.0,
                                      0.0)),
                              DayButton('Mon'),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (MediaQuery.of(context).size.width / 5) /
                                          4,
                                      0.0,
                                      0.0,
                                      0.0)),
                              DayButton('Tue'),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (MediaQuery.of(context).size.width / 5) /
                                          4,
                                      0.0,
                                      0.0,
                                      0.0)),
                              DayButton('Wed'),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (MediaQuery.of(context).size.width / 5) /
                                          4,
                                      0.0,
                                      0.0,
                                      0.0)),
                              DayButton('Thu'),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (MediaQuery.of(context).size.width / 5) /
                                          4,
                                      0.0,
                                      0.0,
                                      0.0)),
                              DayButton('Fri'),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (MediaQuery.of(context).size.width / 5) /
                                          4,
                                      0.0,
                                      0.0,
                                      0.0)),
                              DayButton('Sat'),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (MediaQuery.of(context).size.width / 5) /
                                          4,
                                      0.0,
                                      0.0,
                                      0.0)),
                              DayButton('Sun'),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (MediaQuery.of(context).size.width / 5) /
                                          4,
                                      0.0,
                                      0.0,
                                      0.0)),
                            ])))),
                //-------------------------------------------------------------------------------------------------
              ])),
          Padding(
              padding: EdgeInsets.fromLTRB(
                  0.0,
                  ((MediaQuery.of(context).size.height / 1.75) -
                          ((MediaQuery.of(context).size.height / 14) * 4)) /
                      5,
                  0.0,
                  0.0)),
          Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(
                    (MediaQuery.of(context).size.width -
                            (MediaQuery.of(context).size.width / 3.5 * 2)) /
                        3,
                    0.0,
                    0.0,
                    0.0)),
            //Button + ------------------------------------------------------------------------------------
            ButtonTheme(
                minWidth: (MediaQuery.of(context).size.width / 3.5) / 3,
                height: MediaQuery.of(context).size.height / 20,
                child: RaisedButton(
                  onPressed: () {
                    _addNewCustomSchedule();
                  },
                  shape: CircleBorder(),
                  child: Text('+',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: (MediaQuery.of(context).size.height) / 20)),
                  color: HexColor("#5f44a3"),
                )),
            //---------------------------------------------------------------------------------------------
            Padding(
                padding: EdgeInsets.fromLTRB(
                    (MediaQuery.of(context).size.width / 3.5) / 3,
                    0.0,
                    0.0,
                    0.0)),
            //Button - ------------------------------------------------------------------------------------
            ButtonTheme(
                minWidth: (MediaQuery.of(context).size.width / 3.5) / 3,
                height: MediaQuery.of(context).size.height / 20,
                child: RaisedButton(
                  onPressed: () {
                    _removeCustomSchedule();
                  },
                  shape: CircleBorder(),
                  child: Text('-',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: (MediaQuery.of(context).size.height) / 20)),
                  color: HexColor("#5f44a3"),
                )),
            //---------------------------------------------------------------------------------------------
            Padding(
                padding: EdgeInsets.fromLTRB(
                    (MediaQuery.of(context).size.width -
                            (MediaQuery.of(context).size.width / 3.5 * 2)) /
                        3,
                    0.0,
                    0.0,
                    0.0)),
            //Button Next ------------------------------------------------------------------------------------
            ButtonTheme(
                minWidth: MediaQuery.of(context).size.width / 3.5,
                height: MediaQuery.of(context).size.height / 20,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QuestionnaireEnd();
                    }));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height / 40)),
                  color: HexColor("#5f44a3"),
                )),
          ])
        ]));
  }

  void _addNewCustomSchedule() {
    setState(() {
      if (_count < 4) {
        _count += 1;
      }
    });
  }

  void _removeCustomSchedule() {
    setState(() {
      if (_count > 1) {
        _count -= 1;
      }
    });
  }

  ListView _customSchedules() {
    return ListView.builder(
        itemCount: _count,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return ButtonTheme(
              minWidth: MediaQuery.of(context).size.width / 3.5,
              height: MediaQuery.of(context).size.height / 20,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    if (itsON)
                      itsON = false;
                    else
                      itsON = true;
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: HexColor('#5f44a3'))),
                child: Text('Customized $index',
                    style: TextStyle(
                        color: itsON ? Colors.white : Colors.black,
                        fontSize: MediaQuery.of(context).size.height / 47)),
                color: itsON ? HexColor('#5f44a3') : HexColor('#f4f4f4'),
              ));
        });
  }
}

class CustomizedSchedule extends StatefulWidget {
  final String name;
  CustomizedSchedule(this.name);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomizedSchedule();
  }
}

class _CustomizedSchedule extends State<CustomizedSchedule> {
  bool itsON = false;
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: MediaQuery.of(context).size.width / 3.5,
        height: MediaQuery.of(context).size.height / 20,
        child: RaisedButton(
          onPressed: () {
            setState(() {
              if (itsON)
                itsON = false;
              else
                itsON = true;
            });
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: HexColor('#5f44a3'))),
          child: Text(widget.name,
              style: TextStyle(
                  color: itsON ? Colors.white : Colors.black,
                  fontSize: MediaQuery.of(context).size.height / 47)),
          color: itsON ? HexColor('#5f44a3') : HexColor('#f4f4f4'),
        ));
  }
}

class DayButton extends StatefulWidget {
  final String name;
  DayButton(this.name);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DayButton();
  }
}

class _DayButton extends State<DayButton> {
  bool itsON = false;
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.height / 10,
        child: RaisedButton(
          onPressed: () {
            setState(() {
              if (itsON) {
                itsON = false;
              } else {
                itsON = true;
              }
            });
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Text(widget.name,
              style: TextStyle(
                  color: itsON ? Colors.white : Colors.black,
                  fontSize: MediaQuery.of(context).size.height / 38)),
          color: itsON ? HexColor('#5f44a3') : HexColor('#ffffff'),
        ));
  }
}

/* DAYS OF THE WEEK codigo anterior (usado en la clase DayButton)
 Padding(
                    padding: EdgeInsets.fromLTRB(0.0,
                        MediaQuery.of(context).size.height / 20, 0.0, 0.0)),
                Align(
                    alignment: Alignment(-0.9, 0.0),
                    child: Text('Days of Week',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height / 47,
                            fontWeight: FontWeight.bold))),
                Expanded(
                    flex: 1,
                    child: Container(
                        width: double.infinity,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (MediaQuery.of(context).size.width / 5) /
                                          4,
                                      0.0,
                                      0.0,
                                      0.0)),
                              ButtonTheme(
                                  minWidth:
                                      MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  child: RaisedButton(
                                    //Monday event------------------------------------------------------------
                                    onPressed: () {
                                      setState(() {
                                        if (monON) {
                                          monON = false;
                                        } else {
                                          monON = true;
                                        }
                                      });
                                    },
                                    //------------------------------------------------------------------------
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text('Mon',
                                        style: TextStyle(
                                            color: monON
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: /*24*/ MediaQuery
                                                        .of(context)
                                                    .size
                                                    .height /
                                                38)),
                                    color: monON
                                        ? HexColor('#5f44a3')
                                        : HexColor('#ffffff'),
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (MediaQuery.of(context).size.width / 5) /
                                          4,
                                      0.0,
                                      0.0,
                                      0.0)),
                              ButtonTheme(
                                  minWidth:
                                      MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  child: RaisedButton(
                                    //Tuesday event------------------------------------------------------------
                                    onPressed: () {
                                      setState(() {
                                        if (tueON) {
                                          tueON = false;
                                        } else {
                                          tueON = true;
                                        }
                                      });
                                    },
                                    //------------------------------------------------------------------------
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text('Tue',
                                        style: TextStyle(
                                            color: tueON
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                38)),
                                    color: tueON
                                        ? HexColor('#5f44a3')
                                        : HexColor('#ffffff'),
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (MediaQuery.of(context).size.width / 5) /
                                          4,
                                      0.0,
                                      0.0,
                                      0.0)),
                              ButtonTheme(
                                  minWidth:
                                      MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  child: RaisedButton(
                                    //Wednesday event------------------------------------------------------------
                                    onPressed: () {
                                      setState(() {
                                        if (wedON) {
                                          wedON = false;
                                        } else {
                                          wedON = true;
                                        }
                                      });
                                    },
                                    //------------------------------------------------------------------------
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text('Wed',
                                        style: TextStyle(
                                            color: wedON
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                38)),
                                    color: wedON
                                        ? HexColor('#5f44a3')
                                        : HexColor('#ffffff'),
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (MediaQuery.of(context).size.width / 5) /
                                          4,
                                      0.0,
                                      0.0,
                                      0.0)),
                              ButtonTheme(
                                  minWidth:
                                      MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  child: RaisedButton(
                                    //Thursday event------------------------------------------------------------
                                    onPressed: () {
                                      setState(() {
                                        if (thuON) {
                                          thuON = false;
                                        } else {
                                          thuON = true;
                                        }
                                      });
                                    },
                                    //------------------------------------------------------------------------
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text('Thu',
                                        style: TextStyle(
                                            color: thuON
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                38)),
                                    color: thuON
                                        ? HexColor('#5f44a3')
                                        : HexColor('#ffffff'),
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (MediaQuery.of(context).size.width / 5) /
                                          4,
                                      0.0,
                                      0.0,
                                      0.0)),
                              ButtonTheme(
                                  minWidth:
                                      MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  child: RaisedButton(
                                    //Fridayevent------------------------------------------------------------
                                    onPressed: () {
                                      setState(() {
                                        if (friON) {
                                          friON = false;
                                        } else {
                                          friON = true;
                                        }
                                      });
                                    },
                                    //------------------------------------------------------------------------
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text('Fri',
                                        style: TextStyle(
                                            color: friON
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                38)),
                                    color: friON
                                        ? HexColor('#5f44a3')
                                        : HexColor('#ffffff'),
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (MediaQuery.of(context).size.width / 5) /
                                          4,
                                      0.0,
                                      0.0,
                                      0.0)),
                              ButtonTheme(
                                  minWidth:
                                      MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  child: RaisedButton(
                                    //Saturday event------------------------------------------------------------
                                    onPressed: () {
                                      setState(() {
                                        if (satON) {
                                          satON = false;
                                        } else {
                                          satON = true;
                                        }
                                      });
                                    },
                                    //------------------------------------------------------------------------
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text('Sat',
                                        style: TextStyle(
                                            color: satON
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                38)),
                                    color: satON
                                        ? HexColor('#5f44a3')
                                        : HexColor('#ffffff'),
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (MediaQuery.of(context).size.width / 5) /
                                          4,
                                      0.0,
                                      0.0,
                                      0.0)),
                              ButtonTheme(
                                  minWidth:
                                      MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  child: RaisedButton(
                                    //Sunday event------------------------------------------------------------
                                    onPressed: () {
                                      setState(() {
                                        if (sunON) {
                                          sunON = false;
                                        } else {
                                          sunON = true;
                                        }
                                      });
                                    },
                                    //------------------------------------------------------------------------
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text('Sun',
                                        style: TextStyle(
                                            color: sunON
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                38)),
                                    color: sunON
                                        ? HexColor('#5f44a3')
                                        : HexColor('#ffffff'),
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      (MediaQuery.of(context).size.width / 5) /
                                          4,
                                      0.0,
                                      0.0,
                                      0.0)),
                            ])))),
                //-------------------------------------------------------------------------------------------------
              ])),
          Padding(
              padding: EdgeInsets.fromLTRB(
                  0.0,
                  ((MediaQuery.of(context).size.height / 1.75) -
                          ((MediaQuery.of(context).size.height / 14) * 4)) /
                      5,
                  0.0,
                  0.0)),
          Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(
                    (MediaQuery.of(context).size.width -
                            (MediaQuery.of(context).size.width / 3.5 * 2)) /
                        3,
                    0.0,
                    0.0,
                    0.0)),
            ButtonTheme(
                minWidth: (MediaQuery.of(context).size.width / 3.5) / 3,
                height: MediaQuery.of(context).size.height / 20,
                child: RaisedButton(
                  onPressed: () {
                    _addNewCustomSchedule();
                  },
                  shape: CircleBorder(),
                  child: Text('+',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: (MediaQuery.of(context).size.height) / 20)),
                  color: HexColor("#5f44a3"),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(
                    (MediaQuery.of(context).size.width / 3.5) / 3,
                    0.0,
                    0.0,
                    0.0)),
            ButtonTheme(
                minWidth: (MediaQuery.of(context).size.width / 3.5) / 3,
                height: MediaQuery.of(context).size.height / 20,
                child: RaisedButton(
                  onPressed: () {
                    _removeCustomSchedule();
                  },
                  shape: CircleBorder(),
                  child: Text('-',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: (MediaQuery.of(context).size.height) / 20)),
                  color: HexColor("#5f44a3"),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(
                    (MediaQuery.of(context).size.width -
                            (MediaQuery.of(context).size.width / 3.5 * 2)) /
                        3,
                    0.0,
                    0.0,
                    0.0)),
            ButtonTheme(
                minWidth: MediaQuery.of(context).size.width / 3.5,
                height: MediaQuery.of(context).size.height / 20,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QuestionnaireEnd();
                    }));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height / 40)),
                  color: HexColor("#5f44a3"),
                )),
          ])*/
