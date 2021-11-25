import 'package:flutter/material.dart';
import 'package:widgetlayout/models/draggable_model.dart';
import 'dart:convert';
import 'draggables_model.dart';

class DraggableManager extends ChangeNotifier {
  final DraggablesModel _draggables = DraggablesModel();
  DraggablesModel get draggables => _draggables;

  void changeEditMode(bool isEdit) {
    for (var draggable in _draggables.draggables) {
      draggable.isEditable = isEdit;
    }
  }

  String createDraggablesJsonString() {
    DraggablesJson draggablesJson = DraggablesJson();
    for (var item in _draggables.draggables) {
      draggablesJson.draggables.add(DraggableJson(
        item.widgetName,
        item.positionX,
        item.positionY,
        item.width,
        item.height,
        item.baseWidth,
        item.baseHeight,
        item.currentSize,
        item.isEditable,
        item.isVisible,
      ));
    }

    return json.encode(draggablesJson);
  }

  String createDraggableJsonString() {
    final jsonObj = DraggableJson(
      _draggables.draggables[0].widgetName,
      _draggables.draggables[0].positionX,
      _draggables.draggables[0].positionY,
      _draggables.draggables[0].width,
      _draggables.draggables[0].height,
      _draggables.draggables[0].baseWidth,
      _draggables.draggables[0].baseHeight,
      _draggables.draggables[0].currentSize,
      _draggables.draggables[0].isEditable,
      _draggables.draggables[0].isVisible,
    );

    return json.encode(jsonObj);
  }
}
