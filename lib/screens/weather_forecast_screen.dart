import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_watherguru/api/weather_api.dart';
import 'package:flutter_app_watherguru/main.dart';
import 'package:flutter_app_watherguru/models/weather_forecast_daily.dart';
import 'package:flutter_app_watherguru/screens/select_sity_screen.dart';
import 'package:flutter_app_watherguru/utilities/geolocation.dart';
import 'package:flutter_app_watherguru/widgets/city_details_text_widget.dart';
import 'package:flutter_app_watherguru/widgets/data_provider_inherit.dart';
import 'package:flutter_app_watherguru/models/day_of_week.dart';
import 'package:flutter_app_watherguru/widgets/extra_weather_details_widget.dart';
import 'package:flutter_app_watherguru/widgets/temperature_details_widget.dart';
import 'package:flutter_app_watherguru/widgets/weather_forecast_list_view_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../utilities/WGWidgets.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key, required this.startLocation})
      : super(key: key);

  final Geolocation startLocation;

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  _WeatherForecastScreenState();

  int currentDay = 0;

  String _cityName = '';
  late Future<WeatherForecast> _forecastObject;
  final Geolocation _location = Geolocation();

  @override
  void initState() {
    super.initState();

    _forecastObject =
        WeatherApi().fetchWeatherForecast(location: widget.startLocation);

    MyApp.isLogin = true;
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // double height = size.height;
    // double width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Text('WeatherGuru',
              style: WGWidget.createWhiteTextStyle(30, isBold: true)),
          onTap: () {
            if (WGColors.additionalColor == Colors.blue) {
              WGColors.additionalColor = Colors.orange[700] ?? Colors.black;
              WGColors.backgroundColor =
                  Colors.orangeAccent[200] ?? Colors.black;
            } else {
              WGColors.additionalColor = Colors.blue;
              WGColors.backgroundColor = Colors.blueAccent[100] ?? Colors.black;
            }
            setState(() {});
          },
        ),
        backgroundColor: WGColors.additionalColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.my_location, color: WGColors.mainColor),
          onPressed: () async {
            await _location.getCurrentLocation();
            setState(() {
              _forecastObject =
                  WeatherApi().fetchWeatherForecast(location: _location);
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_city, color: WGColors.mainColor),
            onPressed: () async {
              var route =
                  MaterialPageRoute(builder: (context) => const SelectCity());
              var selectedName = await Navigator.push(context, route);
              if (selectedName != null) {
                setState(() {
                  _cityName = selectedName;
                  _forecastObject =
                      WeatherApi().fetchWeatherForecast(cityName: _cityName);
                });
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
            color: WGColors.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<WeatherForecast>(
                  future: _forecastObject,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return DataProvider(
                          model: snapshot.data as WeatherForecast,
                          child: ChangeNotifierProvider<DayOfWeek>(
                            create: (context) => DayOfWeek(),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 100.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  CityDetailsTextWidget(),
                                  TemperatureDetailsWidget(),
                                  ExtraWeatherDetailsWidget(),
                                  WeatherForecastListViewWidget()
                                ],
                              ),
                            ),
                          ));
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error'));
                    } else {
                      return const Center(
                          child: SpinKitWave(
                        color: WGColors.mainColor,
                        size: 80.0,
                      ));
                    }
                  }),
            )),
      ),
    );
  }
}
