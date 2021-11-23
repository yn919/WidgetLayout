import 'package:flutter/material.dart';

class DrawerModel extends ChangeNotifier {
  DrawerModel(this.menuName, this.isSelected);

  final String menuName;
  bool isSelected;
}
