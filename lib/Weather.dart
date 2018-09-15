import 'package:intl/intl.dart';

class Weather {

  final int id;
  final String main;
  final String description;
  final String icon;
  final String temp;
  final String pressure;
  final String humidity;
  final String tempMin;
  final String tempMax;
  final DateTime date;

  var formatterDate = new DateFormat('yyyy-MM-dd ');
  var formatterHour = new DateFormat('HH:mm  ');

  Weather({this.id, this.main, this.description, this.icon, this.temp, this.pressure,
    this.humidity, this.tempMin, this.tempMax, this.date});

  factory Weather.fromJson(Map<String, dynamic> json) {
    int epochTimeMs = json["dt"]*1000;
    DateTime dateTime = new DateTime.fromMillisecondsSinceEpoch(epochTimeMs);

    return  Weather(
        id: json['weather'][0]['id'],
        main: json['weather'][0]['main'].toString(),
        description: json['weather'][0]['description'].toString(),
        icon: json['weather'][0]['icon'].toString(),
        temp : json['main']['temp'].toString(),
        pressure: json['main']['pressure'].toString(),
        humidity: json['main']['humidity'].toString(),
        tempMin: json['main']['temp_min'].toString(),
        tempMax: json['main']['temp_max'].toString(),
        date: dateTime

    );

  }

  String getDate(){
    return formatterDate.format(date);
  }

  String getTime(){
    return formatterHour.format(date);

  }
  @override
  String toString() {
    return 'Weather{id: $id, main: $main, description: $description, icon: $icon, temp: $temp, pressure: $pressure, humidity: $humidity, tempMin: $tempMin, tempMax: $tempMax, date $date}';
  }





  String getIconResourceForWeatherCondition(int weatherId) {
    // Based on weather code data found at:
    // http://bugs.openweathermap.org/projects/api/wiki/Weather_Condition_Codes
    if (weatherId >= 200 && weatherId <= 232) {
      return "art_storm";
    } else if (weatherId >= 300 && weatherId <= 321) {
      return "art_light_rain";
    } else if (weatherId >= 500 && weatherId <= 504) {
      return "art_rain";
    } else if (weatherId == 511) {
      return "art_snow";
    } else if (weatherId >= 520 && weatherId <= 531) {
      return "art_rain";
    } else if (weatherId >= 600 && weatherId <= 622) {
      return "art_snow";
    } else if (weatherId >= 701 && weatherId <= 761) {
      return "art_fog";
    } else if (weatherId == 761 || weatherId == 781) {
      return "art_storm";
    } else if (weatherId == 800) {
      return "art_clear";
    } else if (weatherId == 801) {
      return "art_light_clouds";
    } else if (weatherId >= 802 && weatherId <= 804) {
      return "art_clouds";
    }
    return "";
  }
}