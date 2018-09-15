
import 'dart:async';
import 'dart:convert';
import 'package:flutter_weather/Forecast.dart';
import 'package:flutter_weather/Weather.dart';
import 'package:http/http.dart' as http;


class WeatherRemoteRepository {

  @override
  Future<Weather> getWeather(String city) async{

    var response = await http.get("https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=0a0d539af11f6d6fb40e37ae5fccafff&units=metric&lang=es");

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));

    }else{
      throw Exception('Failed to load weather');
    }
  }




  @override
  Future<List<Weather>> getForecast(String city) async {
    var response = await http.get("https://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=0a0d539af11f6d6fb40e37ae5fccafff&units=metric&lang=es&cnt=7");
    if (response.statusCode == 200) {
      var decode = json.decode(response.body);

      return (decode["list"] as List).map((i)=>Weather.fromJson(i)).toList();

    }else{
      throw Exception('Failed to load weather');
    }
  }


  @override
  Future<List<Forecast>> getForecastWeek(String city) async {
    var response = await http.get("http://api.openweathermap.org/data/2.5/forecast/daily?q=${city}&units=metric&cnt=7&appid=0a0d539af11f6d6fb40e37ae5fccafff&cnt=10");
    if (response.statusCode == 200) {
      var decode = json.decode(response.body);

      return (decode["list"] as List).map((i)=>Forecast.fromJson(i)).toList();

    }else{
      throw Exception('Failed to load weather');
    }
  }


}
