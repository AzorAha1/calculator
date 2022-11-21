import 'dart:math';
import 'package:calculator/constants.dart';
import 'package:calculator/mythemes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Startpage extends StatefulWidget {
  const Startpage({Key? key}) : super(key: key);

  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  String newinput = '';
  dynamic result;
  bool change = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: change ? Color(0xff22252D) : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: newcontainer(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: ToggleSwitch(
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
                      ),
                      Text(
                        newinput,
                        style: TextStyle(
                            fontSize: 70,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                color: change ? Color(0xff22252D) : Colors.white,
              ),
            ),
            Expanded(
              child: newcontainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buttons(
                          onpressed: () {
                            setState(() {
                              newinput = '';
                              print('clear');
                              change = !change;
                            });
                          },
                          child: Text(
                            'AC',
                            style: ktextstyle.copyWith(color: Colors.amber),
                          ),
                        ),
                        buttons(
                          onpressed: () {
                            print('divide');
                            setState(() {});
                          },
                          child: Icon(
                            FontAwesomeIcons.divide,
                            color: Colors.white30,
                          ),
                        ),
                        buttons(
                          onpressed: () => print('percentage'),
                          child: Icon(
                            FontAwesomeIcons.percentage,
                            color: Colors.white30,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        buttons(
                          onpressed: () {
                            setState(() {
                              newinput = '7';
                              print(newinput);
                            });
                          },
                          child: Text(
                            '7',
                            style: ktextstyle,
                          ),
                        ),
                        buttons(
                          onpressed: () {
                            setState(() {
                              newinput = '8';
                              print(newinput);
                            });
                          },
                          child: Text(
                            '8',
                            style: ktextstyle,
                          ),
                        ),
                        buttons(
                          onpressed: () {
                            setState(() {
                              newinput = '9';
                              print(newinput);
                            });
                          },
                          child: Text(
                            '9',
                            style: ktextstyle,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        buttons(
                          onpressed: () {
                            setState(() {
                              newinput = '4';
                              print(newinput);
                            });
                          },
                          child: Text(
                            '4',
                            style: ktextstyle,
                          ),
                        ),
                        buttons(
                          onpressed: () {
                            setState(() {
                              newinput = '5';
                              print(newinput);
                            });
                          },
                          child: Text(
                            '5',
                            style: ktextstyle,
                          ),
                        ),
                        buttons(
                          onpressed: () {
                            setState(() {
                              newinput = '6';
                              print(newinput);
                            });
                          },
                          child: Text(
                            '6',
                            style: ktextstyle,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        buttons(
                          onpressed: () {
                            setState(() {
                              newinput = '1';
                              print(newinput);
                            });
                          },
                          child: Text(
                            '1',
                            style: ktextstyle,
                          ),
                        ),
                        buttons(
                          onpressed: () {
                            setState(() {
                              newinput = '2';
                              print(newinput);
                            });
                          },
                          child: Text(
                            '2',
                            style: ktextstyle,
                          ),
                        ),
                        buttons(
                          onpressed: () {
                            setState(() {
                              newinput = '3';
                              print(newinput);
                            });
                          },
                          child: Text(
                            '3',
                            style: ktextstyle,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        buttons(
                          onpressed: () => print('refresh'),
                          child: Icon(
                            FontAwesomeIcons.refresh,
                            color: Colors.teal.shade500,
                          ),
                        ),
                        buttons(
                          onpressed: () {
                            setState(() {
                              newinput = '0';
                              print(newinput);
                            });
                          },
                          child: Text(
                            '0',
                            style: ktextstyle,
                          ),
                        ),
                        buttons(
                          onpressed: () => print('dot'),
                          child: Text(
                            '.',
                            style: ktextstyle,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        buttons(
                          onpressed: () => print('equals'),
                          child: Icon(
                            FontAwesomeIcons.equals,
                            color: Colors.amber.shade100,
                          ),
                        ),
                        buttons(
                          onpressed: () => print('add'),
                          child: Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.amber.shade100,
                          ),
                        ),
                        buttons(
                          onpressed: () => print('minus'),
                          child: Icon(
                            FontAwesomeIcons.minus,
                            color: Colors.amber.shade100,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: change ? Color(0xff292D36) : Colors.white,
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

class buttons extends StatelessWidget {
  Widget? child;
  Function()? onpressed;
  buttons({this.child, this.onpressed, this.color});
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: color,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            elevation: 10,
            color: Color(0xff22252D),
            onPressed: onpressed,
            child: child,
          ),
        ),
      ),
    );
  }
}

class newcontainer extends StatelessWidget {
  Color? color;
  Decoration? decoration;
  Widget? child;

  newcontainer({this.color, this.decoration, this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      color: color,
      decoration: decoration,
    );
  }
}
