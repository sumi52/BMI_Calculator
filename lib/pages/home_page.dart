import 'package:flutter/material.dart';
import 'package:bmi_calculator/pages/view_detail.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/homepage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double weightValue = 50;
  double heightValue = 1.2;
  double bmiResult = 0;
  String bmiText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.black),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: (Colors.orange),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: Column(
            children: [
              Card(
                color: Color(0xff2E0249),
                elevation: 5,
                child: Column(
                  children: [
                    Text(
                      'Weight',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${weightValue.round()} kg',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Slider(
                        value: weightValue,
                        activeColor: Colors.orange,
                        inactiveColor: Colors.blueGrey,
                        label: '${weightValue.round()}',
                        onChanged: (changedValue){
                          setState(() {
                            weightValue = changedValue;
                            print(weightValue);
                            result();
                            bmiShowText();
                          });
                        },
                        min: 15,
                        max: 120,
                        divisions: 120,
                      ),
                    ),
                  ],
                ),
              ),
           Card(
          color: Color(0xff2E0249),
          elevation: 5,
            child: Column(
              children: [
                Text(
                  'Height',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${heightValue.toStringAsFixed(2)} m',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                  child: Slider(
                    value: heightValue,
                    activeColor: Colors.orange,
                    inactiveColor: Colors.blueGrey,
                    min: 1.2,
                    max: 2.5,
                    divisions: 200,
                    label: '${heightValue.toStringAsFixed(2)}',
                    onChanged: (changedHeightValue){
                      setState(() {
                        heightValue = changedHeightValue;
                        result();
                        bmiShowText();
                      });
                    },
                  ),
                ),
              ],
             ),
            ),
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
             backgroundColor: Color(0xff5B4B8A),
             child: Text(
               "${bmiResult.toStringAsFixed(2)}",
               style: TextStyle(
                 fontSize: 25,
                 fontWeight: FontWeight.bold,
                 color: Colors.amber
               ),
             ),
             radius: 50,
            ),
              Text(
                '$bmiText',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: (){
                   Navigator.of(context)
                       .pushNamed(ViewDetail.routeName, arguments: bmiText);
                  },
                  style: ElevatedButton.styleFrom(primary: Color(0xffA91079)),
                  child: Text(
                    'View Detail',
                  ),
              ),
            ]
          ),
        ),
      ),
    );
  }

  void result() {
    bmiResult = weightValue / (heightValue * heightValue);
  }

  void bmiShowText() {
    if (bmiResult < 16){
      bmiText = 'Severe Thinness';
    } else if (bmiResult >= 16 && bmiResult <17){
      bmiText = 'Moderate Thinness';
    } else if (bmiResult >= 17 && bmiResult < 18.5) {
      bmiText = 'Mild Thinness';
    } else if (bmiResult >= 18.5 && bmiResult < 25) {
      bmiText = 'Normal';
    } else if (bmiResult >= 25 && bmiResult < 30) {
      bmiText = 'Overweight';
    } else if (bmiResult >= 30 && bmiResult < 34.9) {
      bmiText = 'Obese Class 1';
    } else if (bmiResult >= 35 && bmiResult < 39.9) {
      bmiText = 'Obese Class 2';
    } else {
      bmiText = 'Obese Class 3';
    }
  }
}
