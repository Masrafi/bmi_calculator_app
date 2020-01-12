import 'package:flutter/material.dart';
import 'input_page.dart';
import 'reusable_card.dart';

const yourResultText=TextStyle(
  fontSize: 50.0, fontWeight: FontWeight.bold
)
;const largeResultText=TextStyle(
  fontSize: 100.0, fontWeight: FontWeight.bold
);
const normalTextStyle=TextStyle(
  fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.teal
);

class ResultsPage extends StatelessWidget {
  ResultsPage({this.calculate,this.status,this.message,this.age});
  final String calculate;
  final String status;
  final String message;
  final String age;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate BMI'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Your Result',
                  style: yourResultText,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: Color(0xFF0F1121),
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    status,
                    style: normalTextStyle,
                  ),
                  Text(
                    age,
                    style: normalTextStyle,
                  ),
                  Text(
                    calculate,
                    style: largeResultText,
                  ),
                  Text(
                    message,
                    style: normalTextStyle,
                  )
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RECALCULATE',
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
