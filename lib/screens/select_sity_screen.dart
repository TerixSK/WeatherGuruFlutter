import 'package:weather_guru/utilities/wg_widgets.dart';
import 'package:weather_guru/widgets/select_city_button_widget.dart';
import 'package:weather_guru/widgets/select_city_text_field_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({Key? key}) : super(key: key);

  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  final _cityNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WGColors.backgroundColor,
      body: SafeArea(
          child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: ChangeNotifierProvider<TextEditingController>(
            create: (context) => _cityNameController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SelectCityTextFieldWidget(),
                SizedBox(height: 20.0),
                SelectCityButtonWidget()
              ],
            ),
          ),
        ),
      )),
    );
  }
}
