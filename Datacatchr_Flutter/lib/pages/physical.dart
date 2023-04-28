import 'package:flutter/material.dart';

class Physical extends StatefulWidget {
  // const Evening({Key? key}) : super(key: key);

  @override
  _PhysicalState createState() => _PhysicalState();
}

class _PhysicalState extends State<Physical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('PHYSICAL')),
        body: SafeArea(child: Column())
    );
  }
}
