import 'package:flutter/material.dart';
import 'package:flutter_weather/ToDayScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String city;

  final TextEditingController _searchQuery = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    city = "Neuquen";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: new Scaffold(
          appBar: AppBar(
//          backgroundColor: Color(0xFF346EA8),
            backgroundColor: Color(0xFF3B7881),

            title: new TextField(
              controller: _searchQuery,
              decoration: new InputDecoration(
                fillColor: Colors.white,
                hintText: "City name",
                filled: true,
                contentPadding: new EdgeInsets.fromLTRB(
                  10.0, 10.0, 10.0, 10.0),
              ),
              enabled: false,
              autofocus: true,
              onEditingComplete: (){
                setState(() {
                  city = _searchQuery.text;
                });
              },
            ),

            bottom: new TabBar(tabs: <Widget>[
              new Tab(text: "Hoy", ),
              new Tab(text: "Semana",),

            ],labelColor: Colors.white,),
          ),

          body: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image:  AssetImage("images/background2.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: new TabBarView(children: <Widget>[
              new ToDayScreen(city: city),
//              new WeekForecast(city: city,),
            ]),
          )
      ),
    );
  }
}
