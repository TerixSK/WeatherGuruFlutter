import 'package:flutter/material.dart';
import 'package:flutter_app_watherguru/models/weather_forecast_daily.dart';
import 'package:flutter_app_watherguru/utilities/WGWidgets.dart';
import 'package:flutter_app_watherguru/utilities/forecast_util.dart';
import 'package:provider/src/provider.dart';

import 'data_provider_inherit.dart';
import '../models/day_of_week.dart';

class CityDetailsTextWidget extends StatelessWidget {
  const CityDetailsTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = DataProvider.read(context)?.model ?? WeatherForecast();
    final currentDay = context.watch<DayOfWeek>().currentDay;
    const int dateConversionConst = 1000;
    int date = (model.list?[currentDay]?.dt ?? 0) * dateConversionConst;
    var formattedDate = DateTime.fromMillisecondsSinceEpoch(date);

    return Column(
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
    );
  }
}
