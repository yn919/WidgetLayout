import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetlayout/models/draggable_manager.dart';
import 'package:widgetlayout/views/layout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final draggableManager = DraggableManager();
    draggableManager.createDraggablesList();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DraggableManager>(
          create: (context) => draggableManager,
        )
      ],
      child: MaterialApp(
        title: 'Widget Layout',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LayoutPage(),
      ),
    );
  }
}
