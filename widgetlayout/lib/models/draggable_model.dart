import 'package:flutter/material.dart';

class DraggableModel extends ChangeNotifier {
  String _widetName = 'widget1';
  String get widgetName => _widetName;
  set widgetName(String value) {
    _widetName = value;
    notifyListeners();
  }

  Offset _position = const Offset(0, 0);
  Offset get position => _position;
  set position(Offset value) {
    _position = value;
    notifyListeners();
  }

  double _width = 100;
  double get width => _width;
  set width(double value) {
    _width = value;
    notifyListeners();
  }

  double _height = 100;
  double get height => _height;
  set height(double value) {
    _height = value;
    notifyListeners();
  }

  bool _isEditable = false;
  bool get isEditable => _isEditable;
  set isEditable(bool value) {
    _isEditable = value;
    notifyListeners();
  }

  bool _isVisible = true;
  bool get isVisible => _isVisible;
  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }
}
