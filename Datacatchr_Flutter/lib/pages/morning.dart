import 'package:flutter/material.dart';
import '../reusable_card.dart';
import '../constants.dart';
import '../components/buttons.dart';
import 'package:intl/intl.dart';

const activeCardColour = Color(0xFF1D1E33);
int motivation = 0;

class Morning extends StatefulWidget {
  // const Morning({Key? key}) : super(key: key);

  @override
  _MorningState createState() => _MorningState();
}

class _MorningState extends State<Morning> {
  bool oneHasBeenPressed = false;
  bool twoHasBeenPressed = false;

  // bool threeHasBeenPressed = false;
  bool fourHasBeenPressed = false;
  bool fiveHasBeenPressed = false;
  bool sixHasBeenPressed = false;

  // DateTime now = new DateTime.now();
  // DateTime date = new DateTime(now.year, now.month, now.day);

  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');

  // String formattedDate = formatter.format(now);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('MORNING')),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                            DateTime(now.year, now.month, now.day).toString(),
                            style: TextStyle(fontSize: 23)),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            Expanded(
              child: ReusableCard(
                colour: activeCardColour,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        color: oneHasBeenPressed == false
                            ? Color(0xFF8D8E98)
                            : Color(0xFFEB1555),
                        child: Container(child: Text('Slept With Light Off')),
                        onLongPress: () {
                          setState(() {
                            if (oneHasBeenPressed == false) {
                              oneHasBeenPressed = true;
                            } else if (oneHasBeenPressed == true) {
                              oneHasBeenPressed = false;
                            }
                          });
                        }),
                  ],
                ),
              ),
            ),
            Row(children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'MEDITATION TIMER',
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            Expanded(
              child: Row(
                // Morning Checklist
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColour,
                      cardChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                                color: twoHasBeenPressed == false
                                    ? Color(0xFF8D8E98)
                                    : Color(0xFFEB1555),
                                child: Container(child: Text('Drink Water')),
                                onLongPress: () {
                                  setState(() {
                                    if (twoHasBeenPressed == false) {
                                      twoHasBeenPressed = true;
                                    } else if (twoHasBeenPressed == true) {
                                      twoHasBeenPressed = false;
                                    }
                                  });
                                }),
                            // buildRaisedButton('Make Bed', threeHasBeenPressed),
                            ButtonWidget(buttonText: 'The text'),
                            RaisedButton(
                                color: fourHasBeenPressed == false
                                    ? Color(0xFF8D8E98)
                                    : Color(0xFFEB1555),
                                child: Container(
                                    child: Text(
                                        'Say 3 Things You\'re Grateful For Out Loud')),
                                onLongPress: () {
                                  setState(() {
                                    if (fourHasBeenPressed == false) {
                                      fourHasBeenPressed = true;
                                    } else if (fourHasBeenPressed == true) {
                                      fourHasBeenPressed = false;
                                    }
                                  });
                                }),
                            RaisedButton(
                                color: fiveHasBeenPressed == false
                                    ? Color(0xFF8D8E98)
                                    : Color(0xFFEB1555),
                                child: Container(child: Text('Wash Face')),
                                onLongPress: () {
                                  setState(() {
                                    if (fiveHasBeenPressed == false) {
                                      fiveHasBeenPressed = true;
                                    } else if (fiveHasBeenPressed == true) {
                                      fiveHasBeenPressed = false;
                                    }
                                  });
                                }),
                            RaisedButton(
                                color: sixHasBeenPressed == false
                                    ? Color(0xFF8D8E98)
                                    : Color(0xFFEB1555),
                                child: Container(child: Text('Brush Teeth')),
                                onLongPress: () {
                                  setState(() {
                                    if (sixHasBeenPressed == false) {
                                      sixHasBeenPressed = true;
                                    } else if (sixHasBeenPressed == true) {
                                      sixHasBeenPressed = false;
                                    }
                                  });
                                }),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              // Button To Submit
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                  ),
                ),
              ],
            ),
            Row(
              // Meditation Timer
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      colour: activeCardColour,
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(width: double.infinity, height: 10),
                            Text(
                              "How Motivated Do I Feel?",
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(motivation.toString()),
                                  Text(''),
                                ]),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 15.0),
                                  inactiveTrackColor: Color(0xFF8D8E98),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 30),
                                  thumbColor: Color(0xFFEB1555),
                                  activeTrackColor: Color(0xFF8D8E98),
                                  overlayColor: Color(0x19EB1555)),
                              child: Slider(
                                value: motivation.toDouble(),
                                min: -10,
                                max: 10,
                                onChanged: (double newValue) {
                                  setState(() {
                                    motivation = newValue.round();
                                  });
                                },
                              ),
                            )
                          ])),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80.0,
              child: GestureDetector(
                onTap: (){},
                child: ReusableCard(
                  colour: Color(0xFFEB1555),
                  cardChild: Container(
                    alignment: Alignment(0.0, 0.0),
                    width: double.infinity,
                    child: Text('Submit'),
                    padding: EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  RaisedButton buildRaisedButton(buttonText, stateVar) {
    return RaisedButton(
        color: stateVar == false ? Color(0xFF8D8E98) : Color(0xFFEB1555),
        child: Container(child: Text(buttonText)),
        onLongPress: () {
          setState(() {
            if (stateVar == false) {
              stateVar = true;
            } else if (stateVar == true) {
              stateVar = false;
            }
          });
        });
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

///////////////////////////////
//TODO: Figure out why button text widget is returning null instead of a string
//TODO: Have button grab timestamp when pressed and store in state
class ButtonWidget extends StatefulWidget {
  // bool buttonState = false;
  String buttonText = 'Top2';

  ButtonWidget({String buttonText}) {
    // this.buttonState = buttonState;
    // this.buttonText = 'Top1';
  }

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  //

  ButtonWidget({buttonText = 'test text3'}) {
    this.buttonState = buttonState;
    this.buttonText = buttonText;
  }
  bool buttonState = false;
  String buttonText = 'mfkel'; //THIS IS THE ONE!?!?



  @override
  Widget build(BuildContext context) => RaisedButton(
      color: buttonState == false ? Color(0xFF8D8E98) : Color(0xFFEB1555),
      child: Container(
        child: Text(
          buttonText,
        ),
      ),
      onLongPress: () {
        setState(() {
          if (buttonState == false) {
            buttonState = true;
            print(buttonState);
          } else if (buttonState == true) {
            buttonState = false;
            print(buttonState);
          }
        });
      });
}
///////////////////////////////
