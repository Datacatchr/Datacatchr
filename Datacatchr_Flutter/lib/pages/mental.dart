// import 'package:flutter/material.dart';
// import '../components/checklist.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import '../components/buttons.dart';
// import '../pages/morning.dart';
//
// class Mental extends StatefulWidget {
//   // const Mental({Key? key}) : super(key: key);
//   @override
//   _MentalState createState() => _MentalState();
// }
//
// class _MentalState extends State<Mental> {
//   final _formKey = GlobalKey<FormBuilderState>();
//   int day = DateTime.now().day;
//   int month = DateTime.now().month;
//   int year = DateTime.now().year;
//
//   @override
//   Widget build(BuildContext context) {
//     int count = 0;
//     return Scaffold(
//       appBar: AppBar(title: Text('MENTAL')),
//       body: SafeArea(
//         // child: Container()
//         child: FormBuilder(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(children: [
//               //TODO:Figure out how to add specific data to form field
//               //TODO:Figure out how to add multiple pieces of data to a single field
//               FormBuilderField(
//                   name: 'dateWidget',
//                   initialValue: DateTime.now(),
//                   builder: (FormFieldState<dynamic> field) {
//                     int day = DateTime.now().day;
//                     int month = DateTime.now().month;
//                     int year = DateTime.now().year;
//                     // field.didChange(DateTime.now());
//                     return Text(DateTime.now().toString());
//                       // Map<String, Int>();
//                   }),
//               FormBuilderDateRangePicker(
//                   name: 'data',
//                   firstDate: DateTime.now(),
//                   lastDate: DateTime.now()),
//               FormBuilderTextField(
//                 name: 'textfield',
//                 initialValue: DateTime.now().toString(),
//               ),
//               FormBuilderTextField(name: 'textfield2'),
//               FormBuilderTextField(name: 'textfield3'),
//               FormBuilderTextField(name: 'textfield4'),
//               FormBuilderTextField(name: 'textfield5'),
//               FormBuilderTextField(name: 'textfield6'),
//               FormBuilderSlider(
//                   name: 'slider', initialValue: 0, min: -5, max: 5),
//
//               //Build custom form fields
//               FormBuilderField(
//                   name: 'testButton',
//                   builder: (FormFieldState<dynamic> field) {
//                     return InputDecorator(
//                         decoration: InputDecoration(labelText: 'Select Option'),
//                         child: Container(
//                             child: RaisedButton(
//                                 onPressed: () {
//                                   _formKey.currentState.save();
//                                   print(_formKey.currentState.value);
//                                   // print(_formKey.currentState.fields['textfield'].value);
//                                   // _formKey.currentState.reset();
//                                 },
//                                 child: Text('Submit'))));
//                   }),
//               FormBuilderField(
//                   name: 'customButton',
//                   builder: (FormFieldState<dynamic> field) {
//                     return InputDecorator(
//                         decoration: InputDecoration(labelText: 'Press'),
//                         child: Container(child: ButtonWidget()));
//                   }),
//
//               RaisedButton(
//                   onPressed: () {
//                     _formKey.currentState.save();
//                     print(_formKey.currentState.value);
//                     // print(_formKey.currentState.fields['textfield'].value);
//                     // _formKey.currentState.reset();
//                   },
//                   child: Text('Submit')),
//             ]),
//           ),
//           onChanged: () {
//             count += 1;
//             print('Form Has Been Changed $count');
//           },
//         ),
//       ),
//     );
//   }
// }
// const double dragWidgetSize = 30;
//
// class HomePage extends StatelessWidget {
//   // const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final areaHeight = Get.height * 0.70;
//     final areaWidth = Get.width * 0.70;
//     final controller = Get.put(
//       ResizableWidgetController(
//         initialPosition: Offset(areaWidth / 2, areaHeight / 2),
//         areaHeight: areaHeight,
//         areaWidth: areaWidth,
//         height: areaHeight / 2,
//         width: areaWidth / 2,
//         minWidth: 50,
//         minHeight: 50,
//       ),
//     );
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Resizable Widget'),
//       ),
//       body: LayoutBuilder(builder: (context, constraint) {
//         return Container(
//           width: constraint.maxWidth,
//           height: constraint.maxHeight,
//           color: Colors.black,
//           child: UnconstrainedBox(
//             child: Container(
//               width: areaWidth,
//               height: areaHeight,
//               alignment: Alignment.center,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/background.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: ResizableWidget(
//                 dragWidgetHeight: dragWidgetSize,
//                 dragWidgetWidth: dragWidgetSize,
//                 controller: controller,
//                 dragWidget: Container(
//                   height: dragWidgetSize,
//                   width: dragWidgetSize,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white24,
//                   ),
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:resizable_widget/resizable_widget.dart';

void main() {
  runApp(Mental());
}

class Mental extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resizable Widget Example',
      theme: ThemeData.dark(),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  // const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resizable Widget Example'),
      ),
      body: ResizableWidget(
        isHorizontalSeparator: false,
        isDisabledSmartHide: false,
        separatorColor: Colors.white12,
        separatorSize: 4,
        onResized: _printResizeInfo,
        children: [
          Container(color: Colors.greenAccent),
          ResizableWidget(
            isHorizontalSeparator: true,
            separatorColor: Colors.blue,
            separatorSize: 10,
            children: [
              Container(color: Colors.greenAccent),
              ResizableWidget(
                children: [
                  Container(color: Colors.greenAccent),
                  Container(color: Colors.yellowAccent),
                  Container(color: Colors.redAccent),
                ],
                percentages: const [0.2, 0.5, 0.3],
              ),
              Container(color: Colors.redAccent),
            ],
          ),
          Container(color: Colors.redAccent),
        ],
      ),
    );
  }

  void _printResizeInfo(List<WidgetSizeInfo> dataList) {
    // ignore: avoid_print
    print(dataList.map((x) => '(${x.size}, ${x.percentage}%)').join(", "));
  }
}