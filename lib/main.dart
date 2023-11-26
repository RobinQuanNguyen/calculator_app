import 'package:flutter/material.dart';
//import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(const MaterialApp(
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}
class _CalculatorAppState extends State<CalculatorApp> {
  late double first  = 0;
  late double second = 0;
  late String output = '0.00';
  late String _output = '0';
  late String operand = '0';
  onButtonClick(value) {
    // Clear the whole screen
    if (value == "C") {
      first = 0;
      second = 0;
      _output = '0';
      operand = '0';
    }
    else if (value == "+" || value == "-") {
      first = double.parse(output);
      operand = value;
      _output = '0';
    }
    else if (value == "=") {
      second = double.parse(output);
      if (operand == "+") {
        _output = (first + second).toString();
      }
      else if (operand == "-") {
        _output = (first - second).toString();
      }
      first = 0.0;
      second = 0.0;
      operand = "";
    }else {
      _output = _output + value;
    }
    print(_output);
    setState(() {output = double.parse(_output).toStringAsFixed(2);});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //input and output shows in the screen
          Expanded(child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            //color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //Text("App này Quân code hihi", style: TextStyle(
                  //fontSize: 40,
                  //color: Colors.cyanAccent,
                //),
                //),
                SizedBox(
                  height: 30,
                ),
                Text(output.substring(0,output.length-3), style: TextStyle(
                  fontSize: 70,
                  color: Colors.white,
                ),
                ),
              ],
            ),
          ),
          ),
          //button area below
          Row(
            children:[
              button(text: "7", bSize: 65.0, fsize: 20.0),
              button(text: "8", bSize: 65.0, fsize: 20.0),
              button(text: "9", bSize: 65.0, fsize: 20.0),
              button(text: "+", bSize: 0.0, fsize: 18.0),
            ],
          ),
          Row(
            children:[
              button(text: "4", bSize: 65.0, fsize: 20.0),
              button(text: "5", bSize: 65.0, fsize: 20.0),
              button(text: "6", bSize: 65.0, fsize: 20.0),
              button(text: "-", bSize: 0.0, fsize: 18.0),
            ],
          ),
          Row(
            children:[
              button(text: "1", bSize: 65.0, fsize: 20.0),
              button(text: "2", bSize: 65.0, fsize: 20.0),
              button(text: "3", bSize: 65.0, fsize: 20.0),
              button(text: "",buttonBgColor: Colors.transparent, bSize: 10.0, fsize: 15.0),
            ],
          ),
          Row(
            children:[
              button(text: "C",tColor: Colors.redAccent, bSize: 65.0, fsize: 20.0),
              button(text: "0", bSize: 65.0, fsize: 20.0),
              button(text: "",buttonBgColor: Colors.transparent, bSize: 10.0, fsize: 15.0),
              button(text: "=", bSize: 0.0, fsize: 15.0),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({
    text, tColor = Colors.yellowAccent,
    buttonBgColor = Colors.white30, bSize,fsize
  }){
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(bSize)),
            padding: EdgeInsets.all(30),
            primary: buttonBgColor,
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
              text,
              style: TextStyle(
                fontSize: fsize,
                color: tColor,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
