import 'package:flutter/material.dart';
import '../components/buttons.dart';

int work = 0;
int health = 0;
int life = 0;
const activeCardColour = Color(0xFF1D1E33);

class Evening extends StatefulWidget {
  // const Evening({Key? key}) : super(key: key);

  @override
  _EveningState createState() => _EveningState();
}

class _EveningState extends State<Evening> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              child: Text('3/2/22', style: TextStyle(fontSize: 23)),
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
                              "How Do I Feel About My Work?",
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(work.toString()),
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
                                value: work.toDouble(),
                                min: -10,
                                max: 10,
                                onChanged: (double newValue) {
                                  setState(() {
                                    work = newValue.round();
                                  });
                                },
                              ),
                            )
                          ])),
                ),
              ],
            ),
            Container(
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Work Notes',
                ),
              ),
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
                              "How Do I Feel About My Health?",
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(health.toString()),
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
                                value: health.toDouble(),
                                min: -10,
                                max: 10,
                                onChanged: (double newValue) {
                                  setState(() {
                                    health = newValue.round();
                                  });
                                },
                              ),
                            )
                          ])),
                ),
              ],
            ),
            Container(
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Health Notes',
                ),
              ),
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
                              "How Do I Feel About My Life?",
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(life.toString()),
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
                                value: life.toDouble(),
                                min: -10,
                                max: 10,
                                onChanged: (double newValue) {
                                  setState(() {
                                    life = newValue.round();
                                  });
                                },
                              ),
                            ),
                          ])),
                ),
              ],
            ),
            Container(
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Life Notes',
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Win(s) For The Day',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80.0,
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
          ],
        ),
      ),
      // appBar: AppBar(title: Text('EVENING')),
    );
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
