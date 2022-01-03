import 'package:weather_guru/utilities/geolocation.dart';
import 'package:weather_guru/utilities/wg_widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'weather_forecast_screen.dart';

class GeolocationScreen extends StatefulWidget {
  const GeolocationScreen({Key? key}) : super(key: key);

  @override
  _GeolocationScreenState createState() => _GeolocationScreenState();
}

class _GeolocationScreenState extends State<GeolocationScreen> {
  @override
  void initState() {
    super.initState();
    _getLocationData();
  }

  void _getLocationData() async {
    Geolocation location = Geolocation();
    await location.getCurrentLocation();

    var route = MaterialPageRoute(
        builder: (context) => WeatherForecastScreen(startLocation: location));
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: WGColors.backgroundColor,
        child: const Center(
            child: SpinKitWave(
          color: WGColors.mainColor,
          size: 80.0,
        )),
      ),
    );
  }
}
