import 'package:flutter/material.dart';
import 'package:widgetlayout/models/drawer_model.dart';

class DrawerMenusModel extends ChangeNotifier {
  DrawerModel currentSelectedMenu = DrawerModel('Layout', true);

  List<DrawerModel> menus = [
    DrawerModel('Menu', false),
    DrawerModel('Layout', true),
    DrawerModel('Widget List', false),
    DrawerModel('Preset', false),
  ];

  void changeSelected(String menuName) {
    for (var item in menus) {
      if (item.menuName == menuName) {
        item.isSelected = true;
        currentSelectedMenu = item;
      } else {
        item.isSelected = false;
      }
    }
    notifyListeners();
  }
}
