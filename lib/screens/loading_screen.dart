import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
  //    Location location = Location();
//    await location.getCurrentLocation();
//    NetworkHelper networkHelper = NetworkHelper(
//        url:
//            'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
//    var data = await networkHelper.getData();
//    Navigator.push(context, MaterialPageRoute(builder: (context)=> LocationScreen(locationWeather: null,),),);

  var weatherData = await WeatherModel().getLocationWeather();
  // we needed to use await
  // because it takes time and returns future oh man
  // otherwise we see N U L L
  // await or null man.

    Navigator.push(context, MaterialPageRoute(builder: (context)=> LocationScreen(locationWeather: weatherData,),),);
    // print(data.toString());
    // I/flutter (13668): {coord: {lon: 50.01, lat: 36.3}, weather: [{id: 802, main: Clouds, description: scattered clouds, icon: 03n}], base: stations, main: {temp: 280.15, feels_like: 277.6, temp_min: 280.15, temp_max: 280.15, pressure: 1016, humidity: 65}, visibility: 10000, wind: {speed: 1, deg: 290}, clouds: {all: 35}, dt: 1585685034, sys: {type: 1, id: 7465, country: IR, sunrise: 1585707942, sunset: 1585753289}, timezone: 16200, id: 119505, name: Qazvin, cod: 200}
    // only WORKS WHEN GPS IS ON AND INTERNET ONLINE .
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPouringHourglass(color: Colors.white,size: 150 ,),
      ),
    );
  }
}
