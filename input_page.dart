import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'result_page.dart';
import 'final.dart';

const activeCardColor=Colors.teal;
const inactiveCardColor=Color(0xFF1C1B2F);
const labelTextStyle=TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900
);
const calculateButtonStyle=TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

class inputPage extends StatefulWidget {
  @override
  _inputPageState createState() => _inputPageState();
}

class _inputPageState extends State<inputPage> {
  int height=180;
  int weight=60;
  int age=30;
  Color malleCardColor=activeCardColor;
  Color femaleCardColor=inactiveCardColor;

  void updateColor(int gender){
    if(gender==1){
      if(malleCardColor==inactiveCardColor){
        malleCardColor=activeCardColor;
        femaleCardColor=inactiveCardColor;
      }else{
        malleCardColor=inactiveCardColor;
      }
    }

    if(gender==2){
      if(femaleCardColor==inactiveCardColor){
        femaleCardColor=activeCardColor;
        malleCardColor=inactiveCardColor;
      }else{
        femaleCardColor=inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReusableCard(
                      colour: malleCardColor,
                      childCard: iconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  )
                  ,),
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColor(2);
                        });
                      },
                      child: ReusableCard(
                        colour: femaleCardColor,
                        childCard: iconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'Female',
                        ),
                      ),
                    ),
                ),
              ],
            )
            ,),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF121224),
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Height',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: labelTextStyle,
                            ),
                            Text(
                              'CM'
                            )
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          activeColor: Colors.teal,
                          inactiveColor: Colors.grey,
                          onChanged: (double newValue){
                            setState(() {
                              height=newValue.round();
                            });
                          },
                        )
                      ],
                    ),
                  )
                  ,)
              ],
            )
            ,),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF121224),
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: 18.0
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                  ,),
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF121224),
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: TextStyle(
                              fontSize: 18.0
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                  ,),
              ],
            )
            ,),
          GestureDetector(
            onTap: (){
              CalculateBrain cal= CalculateBrain(height: height, weight: weight, age: age);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
                calculate: cal.getCalculate(),
                status: cal.getStatus(),
                message: cal.getMessage(),
                age: cal.getAge()

              )));

            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: calculateButtonStyle,
                ),
              ),
              color: Colors.teal,
              height: 50.0,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
            ),
          )
        ],
      )
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon,this.onPress});
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 55.0,
      ),
      fillColor: Color(0xFF0C0F1E),
      shape: CircleBorder(),
    );
  }
}




