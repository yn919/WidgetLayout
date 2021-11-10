import 'package:flutter/material.dart';
import 'draggable_widget.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: InteractiveViewer(
          constrained: false,
          maxScale: 1.5,
          minScale: 0.1,
          boundaryMargin: const EdgeInsets.all(256.0),
          child: Stack(
            children: [
              SizedBox(
                  width: 1920,
                  height: 720,
                  child: Container(
                    color: Colors.amber,
                  )),
              DraggableWidget(),
            ],
          ),
        ));
  }
}
