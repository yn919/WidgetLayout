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
    final manager = Provider.of<DraggableManager>(context);
    final presetsModel = Provider.of<PresetsModel>(context);
    final model = ModalRoute.of(context)!.settings.arguments as PresetModel;

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
                        await onPressedSaveButton(
                            manager, presetsModel, model, context);
                      },
                      child: const Text('Save')),
                  ElevatedButton(
                      onPressed: () async {
                        await onPressedLoadButton(presetsModel, model, context);
                      },
                      child: const Text('Load'))
                ],
              )
            ],
          ),
        ));
  }

  Future<void> onPressedSaveButton(
      DraggableManager manager,
      PresetsModel presetsModel,
      PresetModel model,
      BuildContext context) async {
    final jsonString = manager.createDraggablesJsonString();
    await presetsModel.saveFile(jsonString, model.presetName);

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('save complete')));
  }

  Future<void> onPressedLoadButton(PresetsModel presetsModel, PresetModel model,
      BuildContext context) async {
    final jsonString = await presetsModel.loadFile(model.presetName);
    print(jsonString);

    if (jsonString != 'error') {
      final map = json.decode(jsonString) as Map;
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('load complete')));
    } else {
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
