import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetlayout/models/draggable_manager.dart';
import 'package:widgetlayout/models/draggable_model.dart';

import 'menu_drawer.dart';

class WidgetListPage extends StatelessWidget {
  const WidgetListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String pageTitle = 'Widget List';
    final manager = Provider.of<DraggableManager>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(pageTitle),
        ),
        drawer: const MenuDrawer(
          selectedMenu: pageTitle,
        ),
        body: ListView.builder(
            itemCount: manager.draggables.draggables.length,
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: manager.draggables.draggables[index],
                  child: WidgetListTile(),
                )));
  }
}

class WidgetListTile extends StatelessWidget {
  const WidgetListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DraggableModel>(
        builder: (context, model, widget) => ListTile(
              leading: Checkbox(
                value: model.isVisible,
                onChanged: (isCheck) => model.isVisible = isCheck!,
              ),
              title: Text(model.widgetName),
              onTap: () =>
                  {Navigator.pushNamed(context, 'Property', arguments: model)},
            ));
  }
}
