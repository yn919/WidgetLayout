import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({Key? key}) : super(key: key);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  bool _isEditable = false;
  Offset _offset = const Offset(0, 0);
  Offset _longPressStartPosition = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: _offset.dx,
        top: _offset.dy,
        width: 150,
        height: 50,
        child: GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onPanUpdate: (DragUpdateDetails details) {
              if (_isEditable == false) return;

              setState(() {
                _offset += details.delta;
              });
            },
            onLongPressStart: (LongPressStartDetails details) {
              // print("start=${details.globalPosition}");
              setState(() {
                _longPressStartPosition = _offset;
              });
            },
            onLongPress: () {
              HapticFeedback.vibrate();
              setState(() {
                _isEditable = !_isEditable;
              });
            },
            onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) {
              // print("${details.offsetFromOrigin}");
              if (_isEditable == false) return;
              setState(() {
                _offset = _longPressStartPosition + details.offsetFromOrigin;
              });
            },
            child: Visibility(
              visible: true,
              child: Opacity(
                opacity: _isEditable ? 0.5 : 1.0,
                child: Container(
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("widget1"),
                      Visibility(
                          visible: _isEditable,
                          child: PopupMenuButton(
                              itemBuilder: (BuildContext context) {
                            return [
                              const PopupMenuItem(child: Text("delete")),
                              const PopupMenuItem(child: Text("property")),
                            ];
                          })),
                    ],
                  ),
                ),
              ),
            )));
  }
}
