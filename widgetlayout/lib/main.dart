import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transformationController = TransformationController();

  @override
  Widget build(BuildContext context) {
    Offset _offset = Offset(0, 0);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: InteractiveViewer(
            alignPanAxis: false,
            constrained: true,
            panEnabled: true,
            scaleEnabled: true,
            boundaryMargin: EdgeInsets.all(256.0),
            minScale: 0.1,
            maxScale: 10.0,
            onInteractionStart: (details) =>
                print('onInteractionStart: ' + details.toString()),
            onInteractionEnd: (details) {
              print('onInteractionEnd: ' + details.toString());
              setState(() {
                // コメントを外すと、操作後に初期位置に戻る
                // _transformationController.value = Matrix4.identity();
              });
            },
            onInteractionUpdate: (details) =>
                print('onInteractionUpdate: ' + details.toString()),
            transformationController: _transformationController,
            child: Stack(
              children: [
                SizedBox(
                  width: 1920,
                  height: 720,
                  child: Container(
                    color: Colors.amber,
                  ),
                ),
                LongPressDraggable(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
                  feedback: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
                  childWhenDragging: Container(),
                  feedbackOffset: const Offset(100, 100),
                )
              ],
            )));
  }
}
