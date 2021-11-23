import 'package:flutter/material.dart';
import 'package:widgetlayout/models/draggable_model.dart';
import 'menu_drawer.dart';

class WidgetPropertyPage extends StatelessWidget {
  const WidgetPropertyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String pageTitle = 'Property';
    final model = ModalRoute.of(context)!.settings.arguments as DraggableModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text(pageTitle),
      ),
      drawer: const MenuDrawer(
        selectedMenu: pageTitle,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          DoublePropertyTile(
              propertyName: 'X', propertyValue: model.position.dx),
          DoublePropertyTile(
              propertyName: 'Y', propertyValue: model.position.dy),
          const SizeDropDown(),
        ],
      ),
    );
  }
}

class DoublePropertyTile extends StatelessWidget {
  const DoublePropertyTile(
      {Key? key, required this.propertyName, required this.propertyValue})
      : super(key: key);
  final String propertyName;
  final double propertyValue;

  @override
  Widget build(BuildContext context) {
    final model = ModalRoute.of(context)!.settings.arguments as DraggableModel;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 100,
          child: Text(propertyName),
        ),
        Expanded(
            child: TextFormField(
          decoration: const InputDecoration(
            hintText: 'Enter Property Value',
          ),
          validator: (String? value) {
            if (value == null ||
                value.isEmpty ||
                double.tryParse(value) == null) {
              return 'Please enter numerical value';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.always,
          initialValue: propertyValue.toString(),
          onChanged: (value) => {
            if (value.isEmpty || double.tryParse(value) == null)
              {model.setDoublePropertyValue(propertyName, propertyValue)}
          },
        ))
      ],
    );
  }
}

class SizeDropDown extends StatelessWidget {
  const SizeDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = ModalRoute.of(context)!.settings.arguments as DraggableModel;

    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      const SizedBox(
        width: 100,
        child: Text('Size'),
      ),
      Expanded(
          child: DropdownButton(
        items: const [
          DropdownMenuItem(
            child: Text('S'),
            value: 'S',
          ),
          DropdownMenuItem(
            child: Text('M'),
            value: 'M',
          ),
          DropdownMenuItem(
            child: Text('L'),
            value: 'L',
          ),
        ],
        value: model.currentSize,
        onChanged: (value) {
          model.setSizePropertyValue(value.toString());
        },
      ))
    ]);
  }
}
