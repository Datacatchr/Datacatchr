import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

//TEST
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: <Widget>[
        Expanded(
          child: Row(children: [
            InputButton('/morning', FontAwesomeIcons.sun, 'MORNING'),
            InputButton('/evening', FontAwesomeIcons.moon, 'EVENING'),
          ]),
        ),
        Expanded(
          child: Row(children: [
            InputButton('/mental', FontAwesomeIcons.brain, 'MENTAL'),
            InputButton('/emotional', FontAwesomeIcons.heart, 'EMOTIONAL'),
          ]),
        ),
        Expanded(
          child: Row(children: [
            InputButton('/financial', FontAwesomeIcons.dollarSign, 'FINANCIAL'),
            InputButton('/physical', FontAwesomeIcons.running, 'PHYSICAL'),
          ]),
        ),
      ]),
    ));
  }
}

class InputButton extends StatelessWidget {
  String routeContext;
  IconData buttonIcon;
  String buttonText;

  InputButton(routeContext, buttonIcon, buttonText) {
    this.routeContext = routeContext;
    this.buttonIcon = buttonIcon;
    this.buttonText = buttonText;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // print (Text( 'FINANCIAL was pressed'),);
          Navigator.pushNamed(context, routeContext);
        },
        child: ReusableCard(
          colour: activeCardColour,
          cardChild: IconContent(
            icon: buttonIcon,
            buttonText: buttonText,
          ),
        ),
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  IconContent({@required this.icon, @required this.buttonText});

  final IconData icon;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 80, color: iconColor),
          SizedBox(height: 15),
          Text(buttonText),
        ]);
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
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
