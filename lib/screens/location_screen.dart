import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/widgets.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();

//  final dynamic locationWeather;
  final locationWeather;

  LocationScreen({this.locationWeather});
}

class _LocationScreenState extends State<LocationScreen> {
  var temperature;
  String cityName;
  int weatherConditionCode;
  String weatherEmoIcon;
  String weatherMassage;
  WeatherModel weatherModel = WeatherModel();

//  String weatherConditionText;

  @override
  void initState() {
    super.initState();

    //    print(widget.locationWeather);
    // because this is called at the start of the widget
    // we don't use set set state method because we don't make
    // any updates.
    updateUi(widget.locationWeather);
  }

  void updateUi(weatherData) {
    //TODO: if entrance was null how we prevent crashing cause all widgets get null in their hands
    // w return; ------------>> to break the function
    if (weatherData == null) {
      setState(() {
        temperature = 0;
        weatherEmoIcon = ' ! ';
        weatherMassage = 'we got ERROR ';
        cityName = 'proccess';
      });

      return; // TODO: BREAKS REST OF IT
    }

    setState(() {

      var temp =weatherData['main']['temp']; // | int some times | double
      temperature = temp.toInt();
//    used | 1. for massages | 2. show temperature
//    temperature = temp.toInt();
// the best practice to see int and double are very different
//    weatherConditionText = weatherData['weather'][0]['main']; // just a descriptive thing
      cityName = weatherData['name']; // string used in massage
      weatherConditionCode =
          weatherData['weather'][0]['id']; // used to change emo
      weatherEmoIcon = weatherModel.getWeatherIcon(weatherConditionCode);
      weatherMassage = weatherModel.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      //TODO: AWAIT OR N U L L ;
                      updateUi(weatherData);
//                        updateUi(null);// test
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );

                      print(typedName);
                      if (typedName != null ){
                        var weatherData = await weatherModel.getCityWeather(typedName);
                        print(weatherData);
                        updateUi(weatherData);
                    // updateUi(typedName); // but returns smae location because of its link req

                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment:  weatherEmoIcon == ' ! ' ?MainAxisAlignment.center:MainAxisAlignment.start,
                  children: <Widget>[
                    Text( weatherEmoIcon == ' ! '?
                      '':'$temperature°',
                      style: kTempTextStyle,
//                      weatherEmoIcon == 'err'? kTempTextStyle.copyWith(color: Colors.red): kTempTextStyle,
                    ),
                    Text(
                      '$weatherEmoIcon',
                      style: weatherEmoIcon == ' ! '
                          ? kConditionTextStyle.copyWith(
                          fontFamily: 'Spartan MB',
                              color: Colors.black,
                              backgroundColor: Color(0x88FFEB3B))
                          : kConditionTextStyle, //.copyWith(color: Colors.red[700],backgroundColor: Colors.yellow)
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0, bottom: 15.0),
                child: Text(
                  '$weatherMassage in $cityName!', //we must use single quotes
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
