import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/weather.dart';
import '../utilities/constants.dart';
import 'city_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.locationWeather});

  final locationWeather;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel weather = WeatherModel();

  DateTime date = DateTime.now();

  late int temperature;
  late int temperatureMin;
  late int temperatureMax;
  late String weatherIcon;
  late String cityName;
  late String dayLocale;
  late String dayName;
  late String weatherCondition;
  late String desc;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        temperatureMin = 0;
        temperatureMax = 0;
        weatherIcon = 'Error';
        cityName = '';
        weatherCondition = '';
        desc = '';
        return;
      }

      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();

      desc = weatherData['weather'][0]['description'];

      var tempMin = weatherData['main']['temp_min'];
      temperatureMin = tempMin.toInt();

      var tempMax = weatherData['main']['temp_max'];
      temperatureMax = tempMax.toInt();

      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);

      cityName = weatherData['name'];

      dayName = DateFormat('EEEE').format(date);
      dayLocale = DateFormat('yMd').format(date);

      weatherCondition = weatherData['weather'][0]['main'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: buildAppBar(),
        body: Container(
          alignment: Alignment.center,
          // constraints: BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      '$cityName',
                      style: conditionTextPrimaryStyle,
                    ),
                  ),
                  Text(
                    '$dayName - $dayLocale',
                    style: timeTextSmallStyle,
                  ),
                ],
              ),
              Image.network(
                weatherIcon,
                height: 160,
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      '$temperature°C',
                      style: conditionTextPrimaryStyle,
                    ),
                  ),
                  Text(
                    '$weatherCondition'.toUpperCase() + ' - $desc',
                    style: conditionTextStyle,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/128/2322/2322701.png',
                    height: 50,
                  ),
                  Text(
                    '$temperatureMin°C',
                    style: smallTemperatureTextStyle,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/128/1684/1684375.png',
                    height: 50,
                  ),
                  Text(
                    '$temperatureMax°C',
                    style: smallTemperatureTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        highlightColor: Colors.transparent,
        splashRadius: 27.5,
        icon: Icon(
          Icons.near_me,
          color: Colors.white,
        ),
        onPressed: () async {
          var weatherData = await weather.getLocationWeather();
          updateUI(weatherData);
        },
      ),
      actions: <Widget>[
        IconButton(
          highlightColor: Colors.transparent,
          splashRadius: 27.5,
          icon: Icon(
            Icons.my_location,
            color: Colors.white,
          ),
          onPressed: () async {
            var typedName = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CityScreen();
                },
              ),
            );
            if (typedName != null) {
              var weatherData = await weather.getCityWeather(typedName);
              updateUI(weatherData);
            }
          },
        )
      ],
    );
  }
}
