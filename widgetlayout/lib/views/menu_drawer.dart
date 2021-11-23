import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetlayout/models/drawer_model.dart';
import 'package:widgetlayout/models/drawers_model.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key, required this.selectedMenu}) : super(key: key);
  final String selectedMenu;

  @override
  Widget build(BuildContext context) {
    final drawers = Provider.of<DrawerMenusModel>(context);

    return Drawer(
      child: ListView.builder(
          itemCount: drawers.menus.length,
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: drawers.menus[index],
              child: index <= 0
                  ? DrawerHeader(
                      child: Text(drawers.menus[index].menuName),
                      decoration: const BoxDecoration(color: Colors.blue),
                    )
                  : MenuItem())),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final drawers = Provider.of<DrawerMenusModel>(context);
    return Consumer<DrawerModel>(
        builder: (context, model, widget) => Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black38))),
              child: ListTile(
                title: Text(model.menuName),
                onTap: () {
                  if (drawers.currentSelectedMenu.menuName == model.menuName) {
                    return;
                  }
                  drawers.changeSelected(model.menuName);
                  Navigator.pushNamed(context, model.menuName);
                },
              ),
            ));
  }
}
