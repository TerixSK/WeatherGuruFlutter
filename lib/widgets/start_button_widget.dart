import 'package:weather_guru/screens/geolocation_screen.dart';
import 'package:weather_guru/utilities/wg_widgets.dart';
import 'package:flutter/material.dart';

class StartButtonWidget extends StatelessWidget {
  const StartButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          var route = MaterialPageRoute(
              builder: (context) => const GeolocationScreen());
          Navigator.push(context, route);
        },
        style: WGWidget.elevatedButtonStyle(),
        child: SizedBox(
          height: 50.0,
          width: 160.0,
          child: Center(
            child: Text('Start',
                style: WGWidget.createWhiteTextStyle(30, isBold: true)),
          ),
        ));
  }
}
