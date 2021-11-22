import 'dart:io';

import 'package:flutter/material.dart';
import 'preset_model.dart';
import 'package:path_provider/path_provider.dart';

class PresetsModel extends ChangeNotifier {
  final _presets = <PresetModel>[];
  List<PresetModel> get presets => _presets;

  void createList() {
    for (int i = 1; i <= 10; i++) {
      PresetModel preset = PresetModel();
      preset.listItemName = 'preset$i';
      preset.presetName = 'preset$i';

      _presets.add(preset);
    }

    notifyListeners();
  }

  Future<File> getFilePath(int presetIndex) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/preset$presetIndex.json');
  }

  Future<File> saveFile(String jsonString, int presetIndex) async {
    final file = await getFilePath(presetIndex);
    return file.writeAsString(jsonString);
  }

  Future<String> loadFile(int presetIndex) async {
    try {
      final file = await getFilePath(presetIndex);
      return file.readAsString();
    } catch (e) {
      return 'error';
    }
  }
}
