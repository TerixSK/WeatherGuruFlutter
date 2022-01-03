import 'package:weather_guru/utilities/wg_widgets.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class SelectCityButtonWidget extends StatelessWidget {
  const SelectCityButtonWidget({Key? key}) : super(key: key);

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
