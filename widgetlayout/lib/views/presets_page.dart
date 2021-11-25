import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetlayout/models/preset_model.dart';
import 'package:widgetlayout/models/presets_model.dart';
import 'menu_drawer.dart';

class PresetsPage extends StatelessWidget {
  const PresetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String pageTitle = 'Presets';
    final presetsModel = Provider.of<PresetsModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(pageTitle),
        ),
        drawer: const MenuDrawer(
          selectedMenu: pageTitle,
        ),
        body: ListView.builder(
            itemCount: presetsModel.presets.length,
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: presetsModel.presets[index],
                  child: const PresetListTile(),
                )));
  }
}

class PresetListTile extends StatelessWidget {
  const PresetListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PresetModel>(
        builder: (context, model, widget) => ListTile(
              title: Text(model.listItemName),
              onTap: () {
                Navigator.pushNamed(context, 'Preset Detail', arguments: model);
              },
            ));
  }
}
