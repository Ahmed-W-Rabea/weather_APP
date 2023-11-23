import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/Models/Weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String APIkey = '544400b401aa4586b65200202233010';

  WeatherService(this.dio);
  Future<WeatherModel?> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$APIkey &q=Cairo&days=1');

      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } catch (e) {
      return null;
    }
  }

  Future<WeatherModel> getForecast({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$APIkey &q=Cairo&days=1');

      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMesssage = e.response?.data['error']['message'] ??
          'oops there was an error, try again later';
      throw Exception(errorMesssage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops there was an error, try again later");
    }
  }
}
