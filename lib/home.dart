import 'dart:math';
import 'package:calculator/constants.dart';
import 'package:calculator/mythemes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Startpage extends StatefulWidget {
  const Startpage({Key? key}) : super(key: key);

  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  String newinput = '';
  var symbol;
  String result = '';
  bool change = true;
  double num1 = 0;
  double num2 = 0;

  List button = [
    'AC',
    '+',
    '%',
    '/',
    '9',
    '8',
    '7',
    'X',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '^',
    '0',
    '.',
    'ANS',
    '='
  ];

  bool checkoperation({String? input}) {
    if (input == '/' ||
        input == '+' ||
        input == '-' ||
        input == '%' ||
        input == 'X' ||
        input == '^' ||
        input == '=') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: change ? Color(0xff22252D) : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: newcontainer(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ToggleSwitch(
                            initialLabelIndex: 0,
                            totalSwitches: 2,
                            labels: ['☀️', '🌙'],
                            onToggle: (index) {
                              print('switched to: $index');
                              if (index == 0) {
                                setState(() {
                                  change = false;
                                });
                              } else if (index == 1) {
                                setState(() {
                                  change = true;
                                });
                              }
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text(
                              newinput,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: change ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          '$result',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: change ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                color: change ? Color(0xff22252D) : Colors.white,
              ),
            ),
            Expanded(
              flex: 7,
              child: newcontainer(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 1,
                  ),
                  itemCount: button.length,
                  itemBuilder: (context, index) {
                    return buttons(
                      color: checkoperation(input: button[index])
                          ? Colors.teal
                          : Colors.deepPurple,
                      child: Text(
                        button[index],
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onpressed: () {
                        try {
                          if (button[index] == '=') {
                            newinput = newinput.replaceAll('X', '*');
                            Parser p = Parser();
                            Expression exp = p.parse(newinput);
                            ContextModel cm = ContextModel();
                            double eval = exp.evaluate(EvaluationType.REAL, cm);
                            result = eval.toString();
                            
                          }
                        } catch (e) {
                          print(e);
                          setState(() {
                            result = 'ERROR';
                            newinput = '';
                          });
                        }

                        setState(() {
                          newinput += button[index];
                        });

                        if (button[index] == 'AC' || button[index] == '=') {
                          setState(() {
                            newinput = '';
                            result = '';
                            print('cleared');
                          });
                        }
                      },
                    );
                  },
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class buttons extends StatefulWidget {
  Widget? child;
  Function()? onpressed;
  Function()? ontapped;
  buttons({this.child, this.onpressed, this.color, this.ontapped});
  Color? color;

  @override
  State<buttons> createState() => _buttonsState();
}

class _buttonsState extends State<buttons> {
  bool change = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          elevation: 0,
          color: widget.color,
          onPressed: widget.onpressed,
          child: widget.child,
        ),
      ),
    );
  }
}

class newcontainer extends StatefulWidget {
  Color? color;
  Decoration? decoration;
  Widget? child;

  newcontainer({this.color, this.decoration, this.child});

  @override
  State<newcontainer> createState() => _newcontainerState();
}

class _newcontainerState extends State<newcontainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
      color: widget.color,
      decoration: widget.decoration,
    );
  }
}
