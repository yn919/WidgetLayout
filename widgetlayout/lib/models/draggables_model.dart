import 'package:flutter/material.dart';
import 'draggable_model.dart';

class DraggablesModel extends ChangeNotifier {
  List<DraggableModel> draggables = [
    DraggableModel()
      ..widgetName = 'widget1'
      ..position = Offset(100.toDouble() * 0, 0)
      ..baseWidth = 100
      ..baseHeight = 100
      ..width = 100
      ..height = 100
      ..isEditable = false
      ..isVisible = true,
    DraggableModel()
      ..widgetName = 'widget2'
      ..position = Offset(100.toDouble() * 1, 0)
      ..baseWidth = 100
      ..baseHeight = 100
      ..width = 100
      ..height = 100
      ..isEditable = false
      ..isVisible = true,
    DraggableModel()
      ..widgetName = 'widget3'
      ..position = Offset(100.toDouble() * 2, 0)
      ..baseWidth = 100
      ..baseHeight = 100
      ..width = 100
      ..height = 100
      ..isEditable = false
      ..isVisible = true,
    DraggableModel()
      ..widgetName = 'widget4'
      ..position = Offset(100.toDouble() * 3, 0)
      ..baseWidth = 100
      ..baseHeight = 100
      ..width = 100
      ..height = 100
      ..isEditable = false
      ..isVisible = true,
    DraggableModel()
      ..widgetName = 'widget5'
      ..position = Offset(100.toDouble() * 4, 0)
      ..baseWidth = 100
      ..baseHeight = 100
      ..width = 100
      ..height = 100
      ..isEditable = false
      ..isVisible = true,
  ];
}

class DraggablesJson {
  List<DraggableJson> draggables = [];

  DraggablesJson(this.draggables);

  DraggablesJson.fromJson(Map<String, dynamic> json)
      : draggables = (json['draggables'] as List)
            .map((i) => DraggableJson.fromJson(json))
            .toList();
}
