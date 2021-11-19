import 'package:flutter/material.dart';

class PresetModel extends ChangeNotifier {
  String _listItemName = 'preset1';
  String get listItemName => _listItemName;
  set listItemName(String value) {
    _listItemName = value;
    notifyListeners();
  }

  String presetName = 'preset1';
}
