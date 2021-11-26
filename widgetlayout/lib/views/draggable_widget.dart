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
            left: model.positionX,
            top: model.positionY,
            width: model.width,
            height: model.height,
            child: GestureDetector(
                behavior: HitTestBehavior.deferToChild,
                onPanUpdate: (DragUpdateDetails details) {
                  if (model.isEditable == false) return;
                  model.positionX += details.delta.dx;
                  model.positionY += details.delta.dy;
                },
                onLongPressStart: (LongPressStartDetails details) {
                  _longPressStartPosition =
                      Offset(model.positionX, model.positionY);
                },
                onLongPress: () {
                  HapticFeedback.vibrate();
                  manager.changeEditMode(!model.isEditable);
                },
                onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) {
                  if (model.isEditable == false) return;
                  model.positionX =
                      _longPressStartPosition.dx + details.offsetFromOrigin.dx;
                  model.positionY =
                      _longPressStartPosition.dy + details.offsetFromOrigin.dy;
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
                                      onSelected: (value) {
                                        if (value == 'Property') {
                                          Navigator.pushNamed(
                                              context, 'Property',
                                              arguments: model);
                                        }
                                      },
                                      itemBuilder: (BuildContext context) => [
                                            PopupMenuItem(
                                              child: const Text('Delete'),
                                              value: 'Delete',
                                              onTap: () =>
                                                  {model.isVisible = false},
                                            ),
                                            PopupMenuItem(
                                              child: const Text('Property'),
                                              value: 'Property',
                                              onTap: () => {},
                                            ),
                                          ])),
                            ],
                          ),
                        )),
                  ),
                ))));
  }
}
