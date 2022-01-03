import 'package:weather_guru/utilities/wg_widgets.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class SelectCityTextFieldWidget extends StatelessWidget {
  const SelectCityTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = context.read<TextEditingController>();
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.name,
      cursorColor: WGColors.additionalColor,
      style: WGWidget.createWhiteTextStyle(20, color: WGColors.additionalColor),
      decoration: InputDecoration(
        hintText: 'Enter City Name',
        hintStyle:
            WGWidget.createWhiteTextStyle(20, color: WGColors.additionalColor),
        filled: true,
        fillColor: WGColors.mainColor,
        suffixIcon: IconButton(
          onPressed: () {
            _controller.clear();
          },
          icon: Icon(Icons.clear, color: WGColors.additionalColor),
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide.none),
        prefixIcon: Icon(
          Icons.search,
          color: WGColors.additionalColor,
          size: 40.0,
        ),
      ),
    );
  }
}
