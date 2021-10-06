import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


//TODO: When importing libraries or plugins you should be copy Pasting DOCUMENTATION for that too


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {



  @override
  void initState() {
    super.initState();
    getLocation();

  }


  void getLocation() async {
    print('starting async func');

    //actual coffee

    Position position =  await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    //coffee recite

    // Future<Position> position = Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print('not found');
    // ===============QUESTION=================
    //its very odd that the console output differs when internet is one
    //---------------------------------------------
    //I/flutter ( 1852): starting async func
    //I/flutter ( 1852): not found
    //I/flutter ( 1852): Lat: 36.2982293, Long: 50.0131452
    //---------------------------------------------
    // and when internet or gps is off it really
    //---------------------------------------------
    //I/flutter (30513): starting async func
    //I/flutter (31487): starting async func
    //I/flutter (31487): starting async func
    //---------------------------------------------
    // it really does'nt behave like async when net is off
    // ===============ANSWER=================
    // the answer is when we put async function a await thing it must wait
    // at that point to await finishes its on job then we go to rest of the async function.
    // for more info look at screenshots from scratch.dart .
    //TODO: look scratch.dart for the detailed answer
    print(position);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      body: Center(
//        child: RaisedButton(
//          onPressed: () {
//            //Get the current location
//
//            getLocation();
//
//          },
//          child: Text('Get Location'),
//        ),
//      ),
    );
  }
}
