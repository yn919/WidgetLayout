import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetlayout/models/draggable_manager.dart';
import 'package:widgetlayout/models/draggables_model.dart';
import 'package:widgetlayout/views/draggable_widget.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<DraggableManager>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Layout'),
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
                child: Stack(children: createDraggables(manager)),
              )),
        ));
  }

  List<Widget> createDraggables(DraggableManager manager) {
    List<Widget> widgets = [];
    DraggablesModel draggables = manager.draggables;
    for (var item in draggables.draggables) {
      DraggableWidget widget = DraggableWidget(
        model: item,
        manager: manager,
      );
      widgets.add(widget);
    }

    return widgets;
  }
}
