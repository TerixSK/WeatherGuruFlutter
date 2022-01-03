import 'package:flutter/material.dart';
import 'package:flutter_app_watherguru/models/weather_forecast_daily.dart';
import 'package:flutter_app_watherguru/utilities/WGWidgets.dart';
import 'package:flutter_app_watherguru/models/day_of_week.dart';
import 'package:flutter_app_watherguru/utilities/forecast_util.dart';
import 'package:provider/src/provider.dart';
import 'package:spring/spring.dart';

import 'data_provider_inherit.dart';

class WeatherForecastListViewWidget extends StatelessWidget {
  const WeatherForecastListViewWidget({Key? key}) : super(key: key);

  Container _createListViewItem(
      String dayOfWeek, String temperature, String iconUrl) {
    return Container(
      height: 50,
      width: 170,
      decoration: const BoxDecoration(
        color: WGColors.listViewItemColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            dayOfWeek,
            style: WGWidget.createWhiteTextStyle(30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$temperature °C',
                style: WGWidget.createWhiteTextStyle(28),
              ),
              const SizedBox(width: 5.0),
              Image.network(
                iconUrl,
                color: WGColors.mainColor,
                scale: 1,
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = DataProvider.read(context)?.model ?? WeatherForecast();

    return Spring.fadeIn(
      animDuration: WGWidget.fadeInDuration,
      child: Column(
        children: [
          Text(
            '7-DAY WEATHER FORECAST',
            style: WGWidget.createWhiteTextStyle(16),
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 120,
              width: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 5.0),
                itemCount: model.list?.length ?? 0,
                itemBuilder: (context, index) {
                  const int dateConversionConst = 1000;
                  int date =
                      (model.list?[index]?.dt ?? 0) * dateConversionConst;
                  var formattedDate = DateTime.fromMillisecondsSinceEpoch(date);
                  var fullDate = Util.getFormattedDate(formattedDate);
                  String dayOfWeek = fullDate.split(',')[0];

                  String temperature =
                      (model.list?[index]?.temp?.day ?? 0).toStringAsFixed(0);

                  String iconUrl = model.list?[0]?.iconUrl ?? '';

                  return InkWell(
                    onTap: () {
                      context.read<DayOfWeek>().currentDay = index;
                    },
                    child: _createListViewItem(dayOfWeek, temperature, iconUrl),
                  );
                },
              )),
        ],
      ),
    );
  }
}
