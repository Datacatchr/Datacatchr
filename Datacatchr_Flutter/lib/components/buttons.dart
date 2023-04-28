import 'package:flutter/material.dart';

class ChecklistButton extends StatelessWidget {
  // const ChecklistButton({Key? key}) : super(key: key);

  ChecklistButton(this.buttonState, this.text, this.setState);

  bool buttonState;
  Function setState;
  String text;
//new branch
  @override
  Widget build(BuildContext context) {
    return  RaisedButton(
        color: buttonState == false ? Color(0xFF8D8E98) : Color(0xFFEB1555),
        child:
        Container(child: Text('Put Retainer Away')),
        onLongPress: () {
          setState(() {
            if (buttonState == false) {
              buttonState = true;
            } else if (buttonState == true) {
              buttonState = false;
            }
          });
        });
  }
}

class timestampButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
