import 'package:flutter/material.dart';
import 'draggable_model.dart';

class DraggablesModel extends ChangeNotifier {
  List<DraggableModel> _draggables = [
    DraggableModel()
      ..widgetName = 'widget1'
      ..positionX = 100.toDouble() * 0
      ..positionY = 0
      ..baseWidth = 100
      ..baseHeight = 100
      ..width = 100
      ..height = 100
      ..isEditable = false
      ..isVisible = true,
    DraggableModel()
      ..widgetName = 'widget2'
      ..positionX = 100.toDouble() * 1
      ..positionY = 0
      ..baseWidth = 100
      ..baseHeight = 100
      ..width = 100
      ..height = 100
      ..isEditable = false
      ..isVisible = true,
    DraggableModel()
      ..widgetName = 'widget3'
      ..positionX = 100.toDouble() * 2
      ..positionY = 0
      ..baseWidth = 100
      ..baseHeight = 100
      ..width = 100
      ..height = 100
      ..isEditable = false
      ..isVisible = true,
    DraggableModel()
      ..widgetName = 'widget4'
      ..positionX = 100.toDouble() * 3
      ..positionY = 0
      ..baseWidth = 100
      ..baseHeight = 100
      ..width = 100
      ..height = 100
      ..isEditable = false
      ..isVisible = true,
    DraggableModel()
      ..widgetName = 'widget5'
      ..positionX = 100.toDouble() * 4
      ..positionY = 0
      ..baseWidth = 100
      ..baseHeight = 100
      ..width = 100
      ..height = 100
      ..isEditable = false
      ..isVisible = true,
  ];
  List<DraggableModel> get draggables => _draggables;
  set draggables(List<DraggableModel> value) {
    _draggables = value;
    notifyListeners();
  }
}

class DraggablesJson {
  List<DraggableJson> draggables = [];

  DraggablesJson();

  DraggablesJson.fromJson(Map<String, dynamic> json)
      : draggables = (json['draggables'] as List)
            .map((i) => DraggableJson.fromJson(i))
            .toList();

  Map<String, dynamic> toJson() =>
      {'draggables': draggables.map((i) => i.toJson()).toList()};
}
