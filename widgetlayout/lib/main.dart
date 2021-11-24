import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetlayout/models/draggable_manager.dart';
import 'package:widgetlayout/models/drawers_model.dart';
import 'package:widgetlayout/views/layout_page.dart';
import 'package:widgetlayout/views/widget_list_page.dart';
import 'package:widgetlayout/views/widget_property_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DraggableManager>(
          create: (context) => DraggableManager(),
        ),
        ChangeNotifierProvider<DrawerMenusModel>(
          create: (context) => DrawerMenusModel(),
        )
      ],
      child: MaterialApp(
        title: 'Widget Layout',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'Layout',
        routes: {
          'Layout': (context) => const LayoutPage(),
          'Widget List': (context) => const WidgetListPage(),
          'Property': (context) => const WidgetPropertyPage()
        },
      ),
    );
  }
}
