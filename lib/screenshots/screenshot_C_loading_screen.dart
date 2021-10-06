import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    getLocation();
    getData();

  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    try {
      http.Response response = await http.get(
          'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
      if (response.statusCode == 200) {
        String data = response.body;

        var decodedData = jsonDecode(data); // must be a var type
        // because it returns things that doesn't know the type of
        // them  ------- but it should be treated in path finding like
        // map data type with [ 'key' ] and arrays [ num ]
        // after reading and copying the path to values and see them
        // TYPES  THEN WE CAN ASSIGN TYPES

        // id json path weather[0].id type int
        int id = decodedData['weather'][0]['id'];
        //TODO: important thing to remember INT AND DOUBLE  differ in type extraction so for double we write numbers with decimal point and for integers we don't use and if we do those wrong we throw Errors
        // main.temp
        double temperature = decodedData['main']['temp'];
        // name json path is name and tpe Str
        String name = decodedData['name'];
        // weather j path is  weather[0].main type str
        String weatherCondition = decodedData['weather'][0]['main'];

        print(' id : $id \n name : $name \n Weather Condition : $weatherCondition \n temperature : $temperature ');
        //I/flutter (28077):  id : 800
        //I/flutter (28077):  name : Tawarano
        //I/flutter (28077):  Weather Condition : Clear

        print(data);
        //I/flutter (28077): {"coord":{"lon":139.01,"lat":35.02},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"base":"stations","main":{"temp":285.514,"pressure":1013.75,"humidity":100,"temp_min":285.514,"temp_max":285.514,"sea_level":1023.22,"grnd_level":1013.75},"wind":{"speed":5.52,"deg":311},"clouds":{"all":0},"dt":1485792967,"sys":{"message":0.0025,"country":"JP","sunrise":1485726240,"sunset":1485763863},"id":1907296,"name":"Tawarano","cod":200}.

        // Test was success full

      } else {
        print(response.statusCode);
      }
    }catch(e){
      print(e);
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
