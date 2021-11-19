import 'package:flutter/material.dart';
import 'draggable_model.dart';

class DraggablesModel extends ChangeNotifier {
  final _draggables = <DraggableModel>[];
  List<DraggableModel> get draggables => _draggables;

  void creatList() {
    for (int i = 1; i <= 10; i++) {
      var widget = DraggableModel();
      widget.widgetName = 'widget$i';
      widget.position = Offset(100.toDouble() * (i - 1), 0);
      widget.width = 100;
      widget.height = 100;
      widget.isEditable = false;
      widget.isVisible = true;

      _draggables.add(widget);
    }

    notifyListeners();
  }
}

class DraggablesJson {
  List<DraggableJson> draggables = [];

  DraggablesJson(this.draggables);

  DraggablesJson.fromJson(Map<String, dynamic> json)
      : draggables = (json['draggables'] as List)
            .map((i) => DraggableJson.fromJson(json))
            .toList();
}
