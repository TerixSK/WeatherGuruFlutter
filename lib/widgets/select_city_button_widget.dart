import 'package:flutter/material.dart';
import 'package:flutter_app_watherguru/utilities/WGWidgets.dart';
import 'package:provider/src/provider.dart';

class SelectCityButton extends StatelessWidget {
  const SelectCityButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cityName = context.watch<TextEditingController>().text;
    return ElevatedButton(
      child: SizedBox(
        height: 40.0,
        width: 160.0,
        child: Center(
          child: Text(
            'See Weather',
            style: WGWidget.createWhiteTextStyle(20, isBold: true),
          ),
        ),
      ),
      style: WGWidget.elevatedButtonStyle(),
      onPressed: () {
        Navigator.pop(context, cityName);
      },
    );
  }
}
