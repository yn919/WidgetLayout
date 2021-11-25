import 'dart:io';
import 'package:flutter/material.dart';
import 'preset_model.dart';
import 'package:path_provider/path_provider.dart';

class PresetsModel extends ChangeNotifier {
  List<PresetModel> presets = [
    PresetModel()
      ..listItemName = 'preset1'
      ..presetName = 'preset1',
    PresetModel()
      ..listItemName = 'preset2'
      ..presetName = 'preset2',
    PresetModel()
      ..listItemName = 'preset3'
      ..presetName = 'preset3',
  ];

  Future<File> getFilePath(String presetName) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$presetName.json');
  }

  Future<File> saveFile(String jsonString, String presetName) async {
    final file = await getFilePath(presetName);
    return file.writeAsString(jsonString);
  }

  Future<String> loadFile(String presetName) async {
    try {
      final file = await getFilePath(presetName);
      return file.readAsString();
    } catch (e) {
      return 'error';
    }
  }
}
