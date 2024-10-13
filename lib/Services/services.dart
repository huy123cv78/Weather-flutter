// ignore: depend_on_referenced_packages
import 'dart:convert';

import 'package:flutter_module_2/Model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  fetchWeather() async {
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=47.608013&lon=-122.335167&appid=34869b159e60ad47f718f6de21fbcc5c"),
      // cập nhật bằng cách thây thể tọa độ chô sau lat= tọa độ , lon=tọa đô
    );
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        throw Exception("Lỗi dữ liệu thời tiết");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
