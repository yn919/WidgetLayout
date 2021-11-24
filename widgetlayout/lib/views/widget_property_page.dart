import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            DoublePropertyTile(
                propertyName: 'X', propertyValue: model.position.dx),
            DoublePropertyTile(
                propertyName: 'Y', propertyValue: model.position.dy),
            const SizeDropDown()
          ],
        ),
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
          onChanged: (value) {
            final doubleValue = double.tryParse(value);
            if (value.isEmpty == false && doubleValue != null) {
              model.setDoublePropertyValue(propertyName, doubleValue);
            }
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
          child: ChangeNotifierProvider<DraggableModel>.value(
              value: model,
              child: Consumer<DraggableModel>(
                builder: (context, provider, widget) => DropdownButton(
                  items: provider.sizeList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                  value: provider.currentSize,
                  onChanged: (value) {
                    provider.setSizePropertyValue(value.toString());
                  },
                ),
              )))
    ]);
  }
}

class SizeRadioList extends StatelessWidget {
  const SizeRadioList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = ModalRoute.of(context)!.settings.arguments as DraggableModel;

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            width: 100,
            child: Text('Size'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: model.sizeList.length,
              itemBuilder: (context, index) => RadioListTile(
                title: Text(model.sizeList[index]),
                value: model.sizeList[index],
                groupValue: model.currentSize,
                onChanged: (value) =>
                    model.setSizePropertyValue(value.toString()),
              ),
            ),
          )
        ]);
  }
}
