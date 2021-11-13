import 'package:flutter/material.dart';
import 'draggable_model.dart';

class DraggableManager extends ChangeNotifier {
  final _draggables = <DraggableModel>[];
  List<DraggableModel> get draggables => _draggables;

  void creatList() {
    for (int i = 1; i <= 10; i++) {
      var widget = DraggableModel();
      widget.widgetName = 'widjet$i}';
      widget.position = Offset(100.toDouble() * i, 0);

      _draggables.add(widget);
    }
  }

  void saveList() {}

  void changeEditMode(bool isEdit) {
    for (var draggable in _draggables) {
      draggable.isEditable = isEdit;
    }
  }
}
