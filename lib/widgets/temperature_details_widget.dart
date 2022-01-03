import 'package:weather_guru/models/day_of_week.dart';
import 'package:weather_guru/models/weather_forecast_daily.dart';
import 'package:weather_guru/utilities/wg_widgets.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:spring/spring.dart';

import 'data_provider_inherit.dart';

class TemperatureDetailsWidget extends StatelessWidget {
  const TemperatureDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = DataProvider.read(context)?.model ?? WeatherForecast();
    final currentDay = context.watch<DayOfWeek>().currentDay;
    var icon = model.list?[currentDay]?.iconUrl ?? '';
    var temperature =
        (model.list?[currentDay]?.temp?.day ?? 0).toStringAsFixed(0);
    var weatherDescription =
        (model.list?[currentDay]?.weather?[0]?.description ?? '').toUpperCase();

    return Spring.fadeIn(
      animDuration: WGWidget.fadeInDuration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(icon, color: WGColors.mainColor, scale: 0.5),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                '$temperature °С',
                style: WGWidget.createWhiteTextStyle(60),
              ),
              Text(
                weatherDescription,
                style: WGWidget.createWhiteTextStyle(18),
              )
            ],
          )
        ],
      ),
    );
  }
}
