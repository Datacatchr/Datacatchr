import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';


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
          Text(buttonText, style: labelTextStyle),
        ]);
  }
}
