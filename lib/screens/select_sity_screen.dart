import 'package:flutter/material.dart';
import 'package:flutter_app_watherguru/utilities/WGWidgets.dart';
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
                SelectCityTextField(),
                SizedBox(height: 20.0),
                SelectCityButton()
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class SelectCityTextField extends StatelessWidget {
  const SelectCityTextField({Key? key}) : super(key: key);

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
