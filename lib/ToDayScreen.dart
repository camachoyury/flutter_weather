import 'package:flutter/material.dart';
import 'package:flutter_weather/Weather.dart';
import 'package:flutter_weather/WeatherRemoteRepository.dart';


class ToDayScreen extends StatefulWidget {

  final String city;

  ToDayScreen({Key key,this.city});

  @override
  State<StatefulWidget> createState() {
    return _ToDayScreen();
  }
}

class _ToDayScreen extends State<ToDayScreen> {

  @override
  Widget build(BuildContext context) {

    return Container(

      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 750.0 / 550.0,

            child: FutureBuilder<Weather>(
                future: WeatherRemoteRepository().getWeather(widget.city),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: 200.0,
                      padding:
                      const EdgeInsets.fromLTRB(30.0, 20.0, 20.0, 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  5.0, 30.0, 5.0, 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: myCustomText(
                                      "${snapshot.data.getDate()}",
                                      20.0,
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        myCustomText(
                                          '${snapshot.data.tempMax} °C',
                                          15.0,
                                        ),
                                        Icon(
                                          Icons.arrow_upward,
                                          color: Colors.red[500],
                                        ),
                                        myCustomText(
                                          '${snapshot.data.tempMin}°C',
                                          15.0,
                                        ),
                                        Icon(
                                          Icons.arrow_downward,
                                          color: Colors.red[500],
                                        )
                                      ],
                                    ),
                                  ),
                                  myCustomText("${snapshot.data.temp}°C", 30.0),
                                  myCustomText("Feel like 13 °C", 20.0)
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding:
                              const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    "images/${snapshot.data.getIconResourceForWeatherCondition(snapshot.data.id)}.png",
                                    fit: BoxFit.cover,
                                  ),
                                  myCustomText("${snapshot.data.description}", 20.0)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(child: new CircularProgressIndicator());
                  }
                }),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),

                child: FutureBuilder<List<Weather>>(
                  future: new WeatherRemoteRepository().getForecast(widget.city),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {

                      return new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return getCard(snapshot.data[index]);
                          });
                    } else {
                      return Center(child: new CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

getCard(Weather _weather) {

  print(_weather.toString());

  return Container(

    padding: const EdgeInsets.all(12.0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text("${_weather.getTime()}", style: TextStyle(fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.asset(
              "images/${_weather.getIconResourceForWeatherCondition(_weather.id)}.png",
//            height: 80.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(
            "${_weather.temp} °C",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Text("${_weather.description}"),
      ],
    ),
  );
}

Widget myCustomText(String text, double size) {
  return new Text(text,
      style: new TextStyle(
          fontSize: size,
          color: Colors.white,
          fontFamily: "Roboto"));
}
