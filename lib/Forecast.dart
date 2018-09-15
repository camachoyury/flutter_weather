class Forecast{




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