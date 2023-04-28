import 'package:flutter/material.dart';


class Emotional extends StatefulWidget {
  // const Emotional({Key? key}) : super(key: key);

  @override
  _EmotionalState createState() => _EmotionalState();
}

class _EmotionalState extends State<Emotional> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('EMOTIONAL')),
        body: SafeArea(child: Column())
    );
  }
}
