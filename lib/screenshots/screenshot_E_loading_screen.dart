import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String apiKey = 'cafab7baaa739d9fda042c263190b11a';

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
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');
    var data = await networkHelper.getData();
    print(data.toString());
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
