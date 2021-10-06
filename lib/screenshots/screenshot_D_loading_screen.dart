import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = 'cafab7baaa739d9fda042c263190b11a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();

    getLocation();
    getData();

  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    // now that we created then here we assigned values to it now
    // we initiate the functions that eed those here
    // and then because these two are related to each
    // we make them one function
    // other wise we passed null values !!!! .
    getData();
  }

  void getData() async {

    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
      // double temperature = decodedData['main']['temp'];
      // String name = decodedData['name'];
      // String weatherCondition = decodedData['weather'][0]['main'];
    } else {
      print(response.statusCode);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('press me to see the  things '),
          onPressed: (){

            getData();
          },
        ),
      ),
    );
  }
}
