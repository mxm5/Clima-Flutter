import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


// TODO: how to handle throw errors w try and catch  and create throws for your own


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getLocation();
    somethingThatExpectsLessThan10(12);
    // if we put it in here we will get a red error in flutter.
  }


  void getLocation() async {
    print('starting async func');
    //actual coffee
    Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    //coffee recite
    // Future<Position> position = Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print('not found');

    print(position);

//    try {
//      Position position = await Geolocator().getCurrentPosition(
//          desiredAccuracy: LocationAccuracy.low);
//      print(position);
//      // in this method there are only two methods that THROW
//      // just by looking at the source we can understand
//      // ===================================================
//      // throw PlatformException(
//      //          code: 'PERMISSION_DENIED',
//      //          message: 'Access to location data denied',
//      //          details: null);.
//      // ===================================================
//      // throw is like return can pass any TYPE .
//
//    } catch(e){
//      print(e);
//    }

  }


  void somethingThatExpectsLessThan10(int n) {
    if (n > 10) {
      throw ' n must be less than 10 or app crashes  ando youuuuuu its me bitch im a goooood errro man yayayayayayayayay';

      // this is the only thing that would be shown in that
      // mobile red error screen yo.
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                // Get the current location

                somethingThatExpectsLessThan10(12);
                // getLocation();
                // but in here the gesture detector
                // by default will catch error with its tru=y
                // throws this .
                // ════════ (14) Exception caught by gesture ══════════════════════════════════════════════════════════
                // n must be less than 10 or app crashes  ando youuuuuu its me bitch im a goooood errro man yayayayayayayayay
                //════════════════════════════════════════════════════════════════════════════════════════════════════.

              },
              child: Text('see how throw destoyes app in action'),
            ),
            RaisedButton(
              onPressed: () {
                //Get the current location

                try {
                  somethingThatExpectsLessThan10(12);
//            getLocation();

                }catch (e){
                  print(e);
                  // throws this
                  // I/flutter (15979):  n must be less than 10 or app crashes  ando youuuuuu its me bitch im a goooood errro man yayayayayayayayay.
                }
              },
              child: Text('see how throw is ebing handled via ty catch '),
            ),
          ],
        ),
      ),
    );
  }
}
