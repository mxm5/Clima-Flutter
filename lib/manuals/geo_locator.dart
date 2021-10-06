//
//Dart pub
//dart pub logo
//Getting Started:
//
//Sign in
//geolocator 5.3.0
//Published Feb 21, 2020 • [Published by a pub.dev verified publisher] baseflow.com
//221 likes
//flutter
//android
//
//Readme Changelog Example Installing
//Versions
//100
//
//Flutter Geolocator Plugin
//
//pub package Build Status codecov
//
//A Flutter geolocation plugin which provides easy access to the platform specific location services (FusedLocationProviderClient or if not available the LocationManager on Android and CLLocationManager on iOS).
//Features
//
//Get the current location of the device;
//Get the last known location;
//Get continuous location updates;
//Check if location services are enabled on the device;
//Translate an address to geocoordinates and vice verse (a.k.a. Geocoding);
//Calculate the distance (in meters) between two geocoordinates;
//Check the availability of Google Play services (on Android only).
//
//Note: The availability of the Google Play Services depends on your country. If your country doesn't support a connection with the Google Play Services, you need to try a VPN to establish a connection. For more information about how to work with Google Play Services visit the following link: https://developers.google.com/android/guides/overview
//Usage
//
//To use this plugin, add geolocator as a dependency in your pubspec.yaml file. For example:
//
//dependencies:
//geolocator: ^5.3.0
//
//Paul Halliday wrote a nice introductory article on getting the user's location using the Geolocator plugin. If you are new to the plugin this would be a great place to get started.
//
//NOTE: As of version 3.0.0 the geolocator plugin switched to the AndroidX version of the Android Support Libraries. This means you need to make sure your Android project is also upgraded to support AndroidX. Detailed instructions can be found here.
//
//The TL;DR version is:
//
//Add the following to your "gradle.properties" file:
//
//android.useAndroidX=true
//android.enableJetifier=true
//
//Make sure you set the compileSdkVersion in your "android/app/build.gradle" file to 28:
//
//android {
//compileSdkVersion 28
//
//...
//}
//
//Make sure you replace all the android. dependencies to their AndroidX counterparts (a full list can be found here: https://developer.android.com/jetpack/androidx/migrate).
//
//API
//Geolocation
//
//To query the current location of the device simply make a call to the getCurrentPosition method:
//
//import 'package:geolocator/geolocator.dart';
//
//Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//
//To query the last known location retrieved stored on the device you can use the getLastKnownPosition method (note that this can result in a null value when no location details are available):
//
//import 'package:geolocator/geolocator.dart';
//
//Position position = await Geolocator().getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
//
//To listen for location changes you can subscribe to the onPositionChanged stream. Supply an instance of the LocationOptions class to configure the desired accuracy and the minimum distance change (in meters) before updates are send to the application.
//
//import 'package:geolocator/geolocator.dart';
//
//var geolocator = Geolocator();
//var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
//
//StreamSubscription<Position> positionStream = geolocator.getPositionStream(locationOptions).listen(
//        (Position position) {
//      print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
//    });
//
//To check if location services are enabled you can call the checkGeolocationPermissionStatus method. This method returns a value of the GeolocationStatus enum indicating the availability of the location services on the device. Optionally you can specify if you want to test for GeolocationPermission.locationAlways or GeolocationPermission.locationWhenInUse (by default GeolocationPermission.location is used, which checks for either one of the previously mentioned permissions). Example usage:
//
//import 'package:geolocator/geolocator.dart';
//
//GeolocationStatus geolocationStatus  = await Geolocator().checkGeolocationPermissionStatus();
//
//By default Geolocator will use FusedLocationProviderClient on Android when Google Play Services are available. It will fall back to LocationManager when it is not available. You can override the behaviour by setting forceAndroidLocationManager.
//
//import 'package:geolocator/geolocator.dart';
//
//Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
//GeolocationStatus geolocationStatus  = await geolocator.checkGeolocationPermissionStatus();
//
//To check if location services are enabled(Location Service(GPS) turned on) on the device checkGeolocationPermissionStatus will return disabled state if location service feature is disabled (or not available) on the device.
//Geocoding
//
//To translate an address into latitude and longitude coordinates you can use the placemarkFromAddress method:
//
//import 'package:geolocator/geolocator.dart';
//
//List<Placemark> placemark = await Geolocator().placemarkFromAddress("Gronausestraat 710, Enschede");
//
//If you want to translate latitude and longitude coordinates into an address you can use the placemarkFromCoordinates method:
//
//import 'package:geolocator/geolocator.dart';
//
//List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(52.2165157, 6.9437819);
//
//Both the placemarkFromAddress and placemarkFromCoordinates accept an optional localeIdentifier parameter. This paramter can be used to enforce the resulting placemark to be formatted (and translated) according to the specified locale. The localeIdentifier should be formatted using the syntax: [languageCode]_[countryCode]. Use the ISO 639-1 or ISO 639-2 standard for the language code and the 2 letter ISO 3166-1 standard for the country code. Some examples are:
//Locale identifier	Description
//en	All English speakers (will translate all attributes to English)
//en_US	English speakers in the United States of America
//en_UK	English speakers in the United Kingdom
//nl_NL	Dutch speakers in The Netherlands
//nl_BE	Dutch speakers in Belgium
//Calculate distance
//
//To calculate the distance (in meters) between two geocoordinates you can use the distanceBetween method. The distanceBetween method takes four parameters:
//Parameter	Type	Description
//startLatitude	double	Latitude of the start position
//startLongitude	double	Longitude of the start position
//endLatitude	double	Latitude of the destination position
//endLongitude	double	Longitude of the destination position
//
//import 'package:geolocator/geolocator.dart';
//
//double distanceInMeters = await Geolocator().distanceBetween(52.2165157, 6.9437819, 52.3546274, 4.8285838);
//
//See also the example project for a complete implementation.
//Permissions
//Android
//
//On Android you'll need to add either the ACCESS_COARSE_LOCATION or the ACCESS_FINE_LOCATION permission to your Android Manifest. To do so open the AndroidManifest.xml file (located under android/app/src/main) and add one of the following two lines as direct children of the <manifest> tag:
//
//<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
//<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
//
//NOTE: Specifying the ACCESS_COARSE_LOCATION permission results in location updates with an accuracy approximately equivalant to a city block. More information can be found here.
//
//iOS
//
//On iOS you'll need to add the NSLocationWhenInUseUsageDescription to your Info.plist file (located under ios/Runner/Base.lproj) in order to access the device's location. Simply open your Info.plist file and add the following:
//
//<key>NSLocationWhenInUseUsageDescription</key>
//<string>This app needs access to location when open.</string>
//
//If you would like to access the device's location when your App is running in the background, you should also add the NSLocationAlwaysAndWhenInUseUsageDescription (if your App support iOS 10 or earlier you should also add the key NSLocationAlwaysUsageDescription) key to your Info.plist file:
//
//<key>NSLocationAlwaysUsageDescription</key>
//<string>This app needs access to location when in the background.</string>
//<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
//<string>This app needs access to location when open and in the background.</string>
//
//Location accuracy
//
//The table below outlines the accuracy options per platform:
//Android	iOS
//lowest	500m	3000m
//low	500m	1000m
//medium	100 - 500m	100m
//high	0 - 100m	10m
//best	0 - 100m	~0m
//bestForNavigation	0 - 100m	Optimized for navigation
//Issues
//
//Please file any issues, bugs or feature request as an issue on our GitHub page.
//Want to contribute
//
//If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug or adding a cool new feature), please carefully review our contribution guide and send us your pull request.
//Author
//
//This Geolocator plugin for Flutter is developed by Baseflow. You can contact us at hello@baseflow.com
//Publisher
//
//[Published by a pub.dev verified publisher] baseflow.com
//About
//
//Geolocation plugin for Flutter. This plugin provides a cross-platform (iOS, Android) API for generic location (GPS etc.) functions.
//
//Repository (GitHub)
//View/report issues
//API reference
//License
//
//MIT (LICENSE)
//Dependencies
//
//equatable, flutter, google_api_availability, location_permissions, meta, vector_math
//More
//
//Packages that depend on geolocator
//Dart language Policy Terms Security Privacy Help RSS/atom feed Report an issue with this site


//==========================================================================
//==========================================================================
//==========================================================================
//==========================================================================
//==========================================================================
//==========================================================================
//==========================================================================




//import 'dart:io';
//
//import 'package:flutter/material.dart';
//
//import 'pages/lookup_address_widget.dart';
//import 'pages/calculate_distance_widget.dart';
//import 'pages/current_location_widget.dart';
//import 'pages/location_stream_widget.dart';
//
//void main() => runApp(GeolocatorExampleApp());
//
//enum TabItem {
//  singleLocation,
//  singleFusedLocation,
//  locationStream,
//  distance,
//  geocode
//}
//
//class GeolocatorExampleApp extends StatefulWidget {
//  @override
//  State<GeolocatorExampleApp> createState() => BottomNavigationState();
//}
//
//class BottomNavigationState extends State<GeolocatorExampleApp> {
//  TabItem _currentItem = TabItem.singleLocation;
//  final List<TabItem> _bottomTabs = [
//    TabItem.singleLocation,
//    if (Platform.isAndroid) TabItem.singleFusedLocation,
//    TabItem.locationStream,
//    TabItem.distance,
//    TabItem.geocode,
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: const Text('Geolocator Example App'),
//        ),
//        body: _buildBody(),
//        bottomNavigationBar: _buildBottomNavigationBar(),
//      ),
//    );
//  }
//
//  Widget _buildBody() {
//    switch (_currentItem) {
//      case TabItem.locationStream:
//        return LocationStreamWidget();
//      case TabItem.distance:
//        return CalculateDistanceWidget();
//      case TabItem.singleFusedLocation:
//        return CurrentLocationWidget(androidFusedLocation: true);
//      case TabItem.geocode:
//        return LookupAddressWidget();
//      case TabItem.singleLocation:
//      default:
//        return CurrentLocationWidget(androidFusedLocation: false);
//    }
//  }
//
//  Widget _buildBottomNavigationBar() {
//    return BottomNavigationBar(
//      type: BottomNavigationBarType.fixed,
//      items: _bottomTabs
//          .map((tabItem) =>
//          _buildBottomNavigationBarItem(_icon(tabItem), tabItem))
//          .toList(),
//      onTap: _onSelectTab,
//    );
//  }
//
//  BottomNavigationBarItem _buildBottomNavigationBarItem(
//      IconData icon, TabItem tabItem) {
//    final String text = _title(tabItem);
//    final Color color =
//    _currentItem == tabItem ? Theme.of(context).primaryColor : Colors.grey;
//
//    return BottomNavigationBarItem(
//      icon: Icon(
//        icon,
//        color: color,
//      ),
//      title: Text(
//        text,
//        style: TextStyle(
//          color: color,
//        ),
//      ),
//    );
//  }
//
//  void _onSelectTab(int index) {
//    TabItem selectedTabItem = _bottomTabs[index];
//
//    setState(() {
//      _currentItem = selectedTabItem;
//    });
//  }
//
//  String _title(TabItem item) {
//    switch (item) {
//      case TabItem.singleLocation:
//        return 'Single';
//      case TabItem.singleFusedLocation:
//        return 'Single (Fused)';
//      case TabItem.locationStream:
//        return 'Stream';
//      case TabItem.distance:
//        return 'Distance';
//      case TabItem.geocode:
//        return 'Geocode';
//      default:
//        throw 'Unknown: $item';
//    }
//  }
//
//  IconData _icon(TabItem item) {
//    switch (item) {
//      case TabItem.singleLocation:
//        return Icons.location_on;
//      case TabItem.singleFusedLocation:
//        return Icons.location_on;
//      case TabItem.locationStream:
//        return Icons.clear_all;
//      case TabItem.distance:
//        return Icons.redo;
//      case TabItem.geocode:
//        return Icons.compare_arrows;
//      default:
//        throw 'Unknown: $item';
//    }
//  }
//}
