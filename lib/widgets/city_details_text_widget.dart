import 'package:weather_guru/models/weather_forecast_daily.dart';
import 'package:weather_guru/utilities/forecast_util.dart';
import 'package:weather_guru/utilities/wg_widgets.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:spring/spring.dart';

import '../models/day_of_week.dart';
import 'data_provider_inherit.dart';

class CityDetailsTextWidget extends StatelessWidget {
  const CityDetailsTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = DataProvider.read(context)?.model ?? WeatherForecast();
    final currentDay = context.watch<DayOfWeek>().currentDay;
    const int dateConversionConst = 1000;
    int date = (model.list?[currentDay]?.dt ?? 0) * dateConversionConst;
    var formattedDate = DateTime.fromMillisecondsSinceEpoch(date);

    return Spring.fadeIn(
      animDuration: WGWidget.fadeInDuration,
      child: Column(
        children: [
          Text(
            '${model.city?.name}, ${model.city?.country}',
            style: WGWidget.createWhiteTextStyle(30),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            Util.getFormattedDate(formattedDate),
            style: WGWidget.createWhiteTextStyle(16),
          ),
        ],
      ),
    );
  }
}
