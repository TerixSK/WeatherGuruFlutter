import 'package:weather_guru/models/day_of_week.dart';
import 'package:weather_guru/models/weather_forecast_daily.dart';
import 'package:weather_guru/utilities/wg_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:spring/spring.dart';

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

    return Spring.fadeIn(
      animDuration: WGWidget.fadeInDuration,
      child: Padding(
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
      ),
    );
  }
}
