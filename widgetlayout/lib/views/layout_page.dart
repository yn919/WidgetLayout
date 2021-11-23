import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetlayout/models/draggable_manager.dart';
import 'package:widgetlayout/models/draggables_model.dart';
import 'package:widgetlayout/views/draggable_widget.dart';
import 'package:widgetlayout/views/menu_drawer.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String pageTitle = 'Layout';
    final manager = Provider.of<DraggableManager>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(pageTitle),
        ),
        drawer: const MenuDrawer(
          selectedMenu: pageTitle,
        ),
        body: InteractiveViewer(
          constrained: false,
          maxScale: 1.5,
          minScale: 0.1,
          boundaryMargin: const EdgeInsets.all(256.0),
          child: SizedBox(
              width: 1920,
              height: 720,
              child: Container(
                color: Colors.black,
                child: Stack(children: createDraggables(manager.draggables)),
              )),
        ));
  }

  List<Widget> createDraggables(DraggablesModel draggables) {
    List<Widget> widgets = [];
    for (var item in draggables.draggables) {
      var widget = ChangeNotifierProvider.value(
        value: item,
        child: DraggableWidget(),
      );

      widgets.add(widget);
    }

    return widgets;
  }
}
