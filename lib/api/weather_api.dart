import 'dart:developer';
import 'dart:convert';

import 'package:flutter_app_watherguru/models/weather_forecast_daily.dart';
import 'package:flutter_app_watherguru/utilities/constants.dart';
import 'package:flutter_app_watherguru/utilities/geolocation.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, Geolocation? location}) async {
    Map<String, String?> queryParametrs;
    if (cityName != null) {
      queryParametrs = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName
      };
    } else if (location != null) {
      queryParametrs = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString()
      };
    } else {
      throw Exception('Invalid input data');
    }

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, queryParametrs);
    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    log('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
