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
    DraggablesJson draggablesJson = DraggablesJson([]);
    for (var item in _draggables.draggables) {
      draggablesJson.draggables.add(DraggableJson(
          item.widgetName,
          item.position,
          item.width,
          item.height,
          item.isEditable,
          item.isVisible));
    }

    return json.encode(draggablesJson);
  }
}
