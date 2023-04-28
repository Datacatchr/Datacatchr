// import 'package:flutter/material.dart';
//
//
// class Financial extends StatefulWidget {
//   // const Financial({Key? key}) : super(key: key);
//
//   @override
//   _FinancialState createState() => _FinancialState();
// }
//
// class _FinancialState extends State<Financial> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('FINANCIAL')),
//         body: SafeArea(child: Column(children: <Widget>[
//           Expanded(child: TextFormField(
//             decoration: const InputDecoration(
//               border: UnderlineInputBorder(),
//               labelText: 'Win(s) For The Day',
//             ),
//           ),)
//         ]))
//     );
//   }
// }
///////////////////////////////////////////////////////
// import 'package:drag_and_drop_gridview/devdrag.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'dart:async';
//
// import 'package:flutter/services.dart';
//
// void main() {
//   runApp(Financial());
// }
//
// class Financial extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<Financial> {
//   List<String> _imageUris = [
//     "https://images.pexels.com/photos/4466054/pexels-photo-4466054.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
//     "https://images.pexels.com/photos/4561739/pexels-photo-4561739.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
//     "https://images.pexels.com/photos/4507967/pexels-photo-4507967.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
//     "https://images.pexels.com/photos/4321194/pexels-photo-4321194.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
//     "https://images.pexels.com/photos/1053924/pexels-photo-1053924.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
//     "https://images.pexels.com/photos/1624438/pexels-photo-1624438.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
//     "https://images.pexels.com/photos/1144687/pexels-photo-1144687.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
//     "https://images.pexels.com/photos/2589010/pexels-photo-2589010.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
//   ];
//
//   int variableSet = 0;
//   ScrollController _scrollController;
//   double width;
//   double height;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Drag And drop Plugin'),
//         ),
//         body: Center(
//           child: DragAndDropGridView(
//             controller: _scrollController,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 3 / 4.5,
//             ),
//             padding: EdgeInsets.all(20),
//             itemBuilder: (context, index) => Card(
//               elevation: 2,
//               child: LayoutBuilder(
//                 builder: (context, costrains) {
//                   if (variableSet == 0) {
//                     height = costrains.maxHeight;
//                     width = costrains.maxWidth;
//                     variableSet++;
//                   }
//                   return GridTile(
//                     child: Image.network(
//                       _imageUris[index],
//                       fit: BoxFit.cover,
//                       height: height,
//                       width: width,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             itemCount: _imageUris.length,
//             onWillAccept: (oldIndex, newIndex) {
//               // Implement you own logic
//
//               // Example reject the reorder if the moving item's value is something specific
//               if (_imageUris[newIndex] == "something") {
//                 return false;
//               }
//               return true; // If you want to accept the child return true or else return false
//             },
//             onReorder: (oldIndex, newIndex) {
//               final temp = _imageUris[oldIndex];
//               _imageUris[oldIndex] = _imageUris[newIndex];
//               _imageUris[newIndex] = temp;
//
//               setState(() {});
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//////////////////////////////////////////////
//https://stackoverflow.com/questions/57080144/how-to-move-element-anywhere-inside-parent-container-with-drag-and-drop-in-flutt
import 'package:flutter/material.dart';
void main() {
  runApp(Financial());
}

class Financial extends StatefulWidget {
  final double top;
  final double left;

  Financial({Key key, this.top, this.left}) : super(key: key);

  @override
  _PositionedDraggableIconState createState() => _PositionedDraggableIconState();
}

class _PositionedDraggableIconState extends State<Financial> {
  GlobalKey _key = GlobalKey();
  double top, left;
  double xOff, yOff;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    top = widget.top;
    left = widget.left;
    super.initState();
  }

  void _getRenderOffsets() {
    final RenderBox renderBoxWidget = _key.currentContext.findRenderObject();
    final offset = renderBoxWidget.localToGlobal(Offset.zero);

    yOff = offset.dy - this.top;
    xOff = offset.dx - this.left;
  }

  void _afterLayout(_) {
    _getRenderOffsets();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: _key,
      top: top,
      left: left,
      child: Draggable(
        child: Icon(Icons.input),
        feedback: Icon(Icons.input),
        childWhenDragging: Container(),
        onDragEnd: (drag) {
          setState(() {
            top = drag.offset.dy - yOff;
            left = drag.offset.dx - xOff;
          });
        },
      ),
    );
  }
}