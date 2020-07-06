import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:healt_rutine/src/questionnaire_others/hexcolor.dart';

//Title-------------------------------------------------------------------------------------------------
class TitleText extends StatelessWidget {
  final String titleText;
  final HexColor titleColor;
  final FontWeight titleFontW;
  final double titleSize;

  TitleText(this.titleText, this.titleColor, this.titleFontW, this.titleSize);

  @override
  Widget build(BuildContext context) {
    return Text(titleText,
        style: TextStyle(
            color: titleColor, fontWeight: titleFontW, fontSize: titleSize));
  }
}

//PercentIndicator--------------------------------------------------------------------------------------
class PercentIndicator extends StatelessWidget {
  final double percentage;
  PercentIndicator(this.percentage);
  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
            alignment: MainAxisAlignment.center,
            width: MediaQuery.of(context).size.width * 0.7,
            lineHeight: MediaQuery.of(context).size.width * 0.03,
            percent: percentage,
            progressColor: HexColor("#5f44a3"));
  }
}

//Button-------------------------------------------------------------------------------------------------
class Raisedbutton extends StatelessWidget{
@override
Widget build(BuildContext context){
  return RaisedButton(
            onPressed: () {
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Text('Next', style: TextStyle(color: Colors.white)),
            color: HexColor("#5f44a3"),
          );
}
}

//Slider-------------------------------------------------------------------------------------------------
class SliderFul extends StatefulWidget{
  final double sliderMin;
  final double sliderMax;
  final HexColor activeColor;

  SliderFul(this.sliderMin, this.sliderMax, this.activeColor);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SliderQuest();
  }

}
class SliderQuest extends State<SliderFul> {
  double currentValue = 0;
  double valueObtained;

  @override
  Widget build(BuildContext context) {
    return Slider(
        min: widget.sliderMin,
        max: widget.sliderMax,
        activeColor: widget.activeColor,
        inactiveColor: Colors.grey,
        value: currentValue,
        onChanged: (double newValue){
          setState(() {
            valueObtained = newValue;
          });
        },);
        }

  void getValue(){

  }
  //double getValue() => setValue();
}