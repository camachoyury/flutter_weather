import 'package:flutter/material.dart';
import 'package:flutter_weather/Forecast.dart';
import 'package:flutter_weather/WeatherRemoteRepository.dart';

class WeekForecast extends StatefulWidget{

  final String city;

  WeekForecast({Key key,this.city});
  @override
  State<StatefulWidget> createState() {
    return _WeekForecast();
  }

}

class _WeekForecast extends State<WeekForecast>{

  @override
  Widget build(BuildContext context) {

    return new Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<List<Forecast>>(
          future: new WeatherRemoteRepository().getForecastWeek(widget.city),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new ForeCastDayWidget(snapshot.data[index]);
                  });
            } else {
              return Center(child: new CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

}


class ForeCastDayWidget extends StatelessWidget {
  final Forecast _weather;

  ForeCastDayWidget(this._weather);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: Image.asset("images/${_weather.getIconResourceForWeatherCondition(_weather.id)}.png", height: 40.0,
        fit: BoxFit.fill,),
      title: myCustomText(_weather.main, 24.0),
      subtitle: myCustomText( _weather.description, 15.0),
      trailing: myCustomText("Temp  ${_weather.day}", 20.0),
    );
  }
}

Widget myCustomText(String text, double size) {
  return new Text(text,
      style: new TextStyle(
          fontSize: size, color: Colors.black, fontFamily: "Roboto"));
}
