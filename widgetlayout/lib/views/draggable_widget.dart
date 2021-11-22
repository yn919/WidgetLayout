import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:widgetlayout/models/draggable_manager.dart';
import 'package:widgetlayout/models/draggable_model.dart';

class DraggableWidget extends StatelessWidget {
  const DraggableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<DraggableManager>(context);
    Offset _longPressStartPosition = const Offset(0, 0);

    return Consumer<DraggableModel>(
        builder: (context, model, child) => Positioned(
            left: model.position.dx,
            top: model.position.dy,
            width: model.width,
            height: model.height,
            child: GestureDetector(
                behavior: HitTestBehavior.deferToChild,
                onPanUpdate: (DragUpdateDetails details) {
                  if (model.isEditable == false) return;
                  model.position += details.delta;
                },
                onLongPressStart: (LongPressStartDetails details) {
                  // print("start=${details.globalPosition}");
                  _longPressStartPosition = model.position;
                },
                onLongPress: () {
                  HapticFeedback.vibrate();
                  manager.changeEditMode(!model.isEditable);
                },
                onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) {
                  // print("${details.offsetFromOrigin}");
                  if (model.isEditable == false) return;
                  model.position =
                      _longPressStartPosition + details.offsetFromOrigin;
                },
                child: Visibility(
                  visible: model.isVisible,
                  child: Opacity(
                    opacity: model.isEditable ? 0.5 : 1.0,
                    child: Container(
                        color: Colors.blue,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(model.widgetName),
                              Visibility(
                                  visible: model.isEditable,
                                  child: PopupMenuButton(
                                      itemBuilder: (BuildContext context) {
                                    return [
                                      const PopupMenuItem(
                                          child: Text("delete")),
                                      const PopupMenuItem(
                                          child: Text("property")),
                                    ];
                                  })),
                            ],
                          ),
                        )),
                  ),
                ))));
  }
}
