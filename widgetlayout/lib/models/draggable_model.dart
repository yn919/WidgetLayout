import 'package:flutter/material.dart';

class DraggableModel extends ChangeNotifier {
  String _widetName = 'widget1';
  String get widgetName => _widetName;
  set widgetName(String value) {
    _widetName = value;
    notifyListeners();
  }

  double _positionX = 0;
  double get positionX => _positionX;
  set positionX(double value) {
    _positionX = value;
    notifyListeners();
  }

  double _positionY = 0;
  double get positionY => _positionY;
  set positionY(double value) {
    _positionY = value;
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

  final List<String> _sizeList = ['S', 'M', 'L'];
  List<String> get sizeList => _sizeList;

  String _currentSize = 'M';
  String get currentSize => _currentSize;
  set currentSize(String value) {
    _currentSize = value;
    notifyListeners();
  }

  double baseWidth = 100;
  double baseHeight = 100;

  void setDoublePropertyValue(String propertyName, double propertyValue) {
    switch (propertyName) {
      case 'X':
        _positionX = propertyValue;
        break;
      case 'Y':
        _positionY = propertyValue;
        break;
      default:
    }

    notifyListeners();
  }

  void setSizePropertyValue(String size) {
    _currentSize = size;

    switch (_currentSize) {
      case 'S':
        _width = baseWidth * 0.8;
        _height = baseHeight * 0.8;
        break;
      case 'M':
        _width = baseWidth * 1.0;
        _height = baseHeight * 1.0;
        break;
      case 'L':
        _width = baseWidth * 1.2;
        _height = baseHeight * 1.2;
        break;
      default:
    }

    notifyListeners();
  }
}

class DraggableJson {
  final String widgetName;
  final double positionX;
  final double positionY;
  final double width;
  final double height;
  final double baseWidth;
  final double baseHeight;
  final String currentSize;
  final bool isEditable;
  final bool isVisible;

  DraggableJson(
    this.widgetName,
    this.positionX,
    this.positionY,
    this.width,
    this.height,
    this.baseWidth,
    this.baseHeight,
    this.currentSize,
    this.isEditable,
    this.isVisible,
  );

  DraggableJson.fromJson(Map<String, dynamic> json)
      : widgetName = json['widgetName'] as String,
        positionX = json['positionX'] as double,
        positionY = json['positionY'] as double,
        width = json['width'] as double,
        height = json['height'] as double,
        baseWidth = json['baseWidth'] as double,
        baseHeight = json['baseHeight'] as double,
        currentSize = json['currentSize'] as String,
        isEditable = json['isEditable'] as bool,
        isVisible = json['isVisible'] as bool;

  Map<String, dynamic> toJson() => {
        'widgetName': widgetName,
        'positionX': positionX,
        'positionY': positionY,
        'width': width,
        'height': height,
        'baseWidth': baseWidth,
        'baseHeight': baseHeight,
        'currentSize': currentSize,
        'isEditable': isEditable,
        'isVisible': isVisible,
      };
}
