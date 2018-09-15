import 'package:intl/intl.dart';

class Forecast {
  final int id;
  final String day;
  final String night;
  final String main;
  final String description;
  final String pressure;
  final String humidity;
  final String min;
  final String max;
  final DateTime date;

  var formatterDate = new DateFormat('yyyy-MM-dd ');
  var formatterHour = new DateFormat('HH:mm  ');

  Forecast(this.id, this.day, this.night, this.main, this.description,
      this.pressure, this.humidity, this.min, this.max, this.date);

  factory Forecast.fromJson(Map<String, dynamic> json) {
    int epochTimeMs = json["dt"] * 1000;
    DateTime dateTime = new DateTime.fromMillisecondsSinceEpoch(epochTimeMs);


    return Forecast(
        json['weather'][0]['id'],
        json['temp']['day'].toString(),
        json['temp']['night'].toString(),
        json['weather'][0]['main'].toString(),
        json['weather'][0]['description'].toString(),
        json['presuse'].toString(),
        json['humidity'].toString(),
        json['temp']['min'].toString(),
        json['temp']['max'].toString(),
        dateTime);
  }

  String getDate(){
    return formatterDate.format(date);

  }

  String getTime(){
    return formatterHour.format(date);

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
