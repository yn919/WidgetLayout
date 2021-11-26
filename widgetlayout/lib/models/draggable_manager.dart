import 'package:flutter/material.dart';
import 'package:widgetlayout/models/draggable_model.dart';
import 'dart:convert';
import 'draggables_model.dart';

class DraggableManager extends ChangeNotifier {
  DraggablesModel _draggables = DraggablesModel();
  DraggablesModel get draggables => _draggables;
  set draggables(DraggablesModel value) {
    _draggables = value;
    notifyListeners();
  }

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

  DraggablesModel parseDraggablesJson(Map<String, dynamic> draggablesMap) {
    DraggablesModel draggablesModel = DraggablesModel();
    draggablesModel.draggables.clear();

    DraggablesJson draggables = DraggablesJson.fromJson(draggablesMap);
    for (var item in draggables.draggables) {
      DraggableModel model = DraggableModel();
      model.widgetName = item.widgetName;
      model.positionX = item.positionX;
      model.positionY = item.positionY;
      model.width = item.width;
      model.height = item.height;
      model.baseWidth = item.baseWidth;
      model.baseHeight = item.baseHeight;
      model.currentSize = item.currentSize;
      model.isEditable = item.isEditable;
      model.isVisible = item.isVisible;

      draggablesModel.draggables.add(model);
    }

    return draggablesModel;
  }
}
