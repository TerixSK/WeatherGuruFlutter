import 'package:flutter/material.dart';
import 'package:flutter_app_watherguru/models/weather_forecast_daily.dart';
import 'package:flutter_app_watherguru/utilities/WGWidgets.dart';
import 'package:flutter_app_watherguru/models/day_of_week.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/src/provider.dart';

import 'data_provider_inherit.dart';

class ExtraWeatherDetailsWidget extends StatelessWidget {
  const ExtraWeatherDetailsWidget({Key? key}) : super(key: key);

  Column _createExtraWeatherDetailsItem(
      IconData iconData, int value, String util) {
    return Column(
      children: [
        Icon(
          iconData,
          color: WGColors.mainColor,
          size: 30,
        ),
        const SizedBox(height: 10),
        Text(
          value.toString(),
          style: WGWidget.createWhiteTextStyle(20),
        ),
        Text(
          util,
          style: WGWidget.createWhiteTextStyle(12),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = DataProvider.read(context)?.model ?? WeatherForecast();
    final currentDay = context.watch<DayOfWeek>().currentDay;
    const double pressureConversionConst = 0.750062;
    var pressure =
        ((model.list?[currentDay]?.pressure ?? 0) * pressureConversionConst)
            .round();
    int humidity = (model.list?[currentDay]?.speed ?? 0).toInt();
    int wind = (model.list?[currentDay]?.speed ?? 0).toInt();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _createExtraWeatherDetailsItem(
              FontAwesomeIcons.thermometerThreeQuarters, pressure, 'mm Hg'),
          _createExtraWeatherDetailsItem(
              FontAwesomeIcons.cloudRain, humidity, '%'),
          _createExtraWeatherDetailsItem(FontAwesomeIcons.wind, wind, 'm/s'),
        ],
      ),
    );
  }
}
