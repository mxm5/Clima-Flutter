import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {


  String cityName;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    print(value);
                    cityName = value;

                  },
//                  onEditingComplete: (x){},// cant assign parameter ERROR
                  style: kMessageTextStyle.copyWith(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w100),
                  decoration: kTextFieldInputDecoration,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context,cityName); // can put objects too or any data type
                  // and has TODO: FUTURE < DYNAMIC > SO AWAIT THEM
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
