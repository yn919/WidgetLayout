import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetlayout/models/draggable_manager.dart';
import 'package:widgetlayout/models/draggables_model.dart';
import 'package:widgetlayout/models/preset_model.dart';
import 'package:widgetlayout/models/presets_model.dart';

class PresetDetailPage extends StatelessWidget {
  const PresetDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Preset Detail'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const ListItemNameTile(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await onPressedSaveButton(context);
                      },
                      child: const Text('Save')),
                  ElevatedButton(
                      onPressed: () async {
                        await onPressedLoadButton(context);
                      },
                      child: const Text('Load'))
                ],
              )
            ],
          ),
        ));
  }

  Future<void> onPressedSaveButton(BuildContext context) async {
    final manager = Provider.of<DraggableManager>(context, listen: false);
    final presetsModel = Provider.of<PresetsModel>(context, listen: false);
    final model = ModalRoute.of(context)!.settings.arguments as PresetModel;

    try {
      final jsonString = manager.createDraggablesJsonString();
      await presetsModel.saveFile(jsonString, model.presetName);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('save complete')));
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('save error')));
    }
  }

  Future<void> onPressedLoadButton(BuildContext context) async {
    final manager = Provider.of<DraggableManager>(context, listen: false);
    final presetsModel = Provider.of<PresetsModel>(context, listen: false);
    final model = ModalRoute.of(context)!.settings.arguments as PresetModel;

    try {
      final draggablesJson = await presetsModel.loadFile(model.presetName);
      final draggablesMap = json.decode(draggablesJson) as Map<String, dynamic>;
      DraggablesModel newModel = manager.parseDraggablesJson(draggablesMap);
      manager.draggables = newModel;

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('load complete')));

      Navigator.pushNamedAndRemoveUntil(context, 'Layout', (_) => false);
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('load error')));
    }
  }
}

class ListItemNameTile extends StatelessWidget {
  const ListItemNameTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = ModalRoute.of(context)!.settings.arguments as PresetModel;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          width: 100,
          child: Text('Name'),
        ),
        Expanded(
            child: TextFormField(
          decoration: const InputDecoration(
            hintText: 'Enter Name Value',
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter value';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialValue: model.listItemName,
          onChanged: (value) {
            model.listItemName = value.toString();
          },
        ))
      ],
    );
  }
}
