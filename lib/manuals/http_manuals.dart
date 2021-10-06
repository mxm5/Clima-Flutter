//
//Dart pub
//dart pub logo
//Getting Started:
//
//Sign in
//http 0.12.0+4
//Published Jan 7, 2020 • [Published by a pub.dev verified publisher] dart.dev
//329 likes
//dart
//native
//js
//flutter
//android
//ios
//web
//
//Readme Changelog Example Installing
//Versions
//100
//
//A composable, Future-based library for making HTTP requests.
//
//pub package Build Status
//
//This package contains a set of high-level functions and classes that make it easy to consume HTTP resources. It's platform-independent, and can be used on both the command-line and the browser.
//Using
//
//The easiest way to use this library is via the top-level functions. They allow you to make individual HTTP requests with minimal hassle:
//
//import 'package:http/http.dart' as http;
//
//var url = 'https://example.com/whatsit/create';
//var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
//print('Response status: ${response.statusCode}');
//print('Response body: ${response.body}');
//
//print(await http.read('https://example.com/foobar.txt'));
//
//If you're making multiple requests to the same server, you can keep open a persistent connection by using a Client rather than making one-off requests. If you do this, make sure to close the client when you're done:
//
//var client = http.Client();
//try {
//var uriResponse = await client.post('https://example.com/whatsit/create',
//body: {'name': 'doodle', 'color': 'blue'});
//print(await client.get(uriResponse.bodyFields['uri']));
//} finally {
//client.close();
//}
//
//You can also exert more fine-grained control over your requests and responses by creating Request or StreamedRequest objects yourself and passing them to Client.send.
//
//This package is designed to be composable. This makes it easy for external libraries to work with one another to add behavior to it. Libraries wishing to add behavior should create a subclass of BaseClient that wraps another Client and adds the desired behavior:
//
//class UserAgentClient extends http.BaseClient {
//  final String userAgent;
//  final http.Client _inner;
//
//  UserAgentClient(this.userAgent, this._inner);
//
//  Future<StreamedResponse> send(BaseRequest request) {
//    request.headers['user-agent'] = userAgent;
//    return _inner.send(request);
//  }
//}
//
//Publisher
//
//[Published by a pub.dev verified publisher] dart.dev
//About
//
//A composable, multi-platform, Future-based API for HTTP requests.
//
//Repository (GitHub)
//View/report issues
//API reference
//License
//
//BSD (LICENSE)
//Dependencies
//
//async, http_parser, path, pedantic
//More
//
//Packages that depend on http
//Dart language Policy Terms Security Privacy Help RSS/atom feed Report an issue with this site




//===================================================================
//===================================================================
//===================================================================
//===================================================================
//===================================================================
//===================================================================



import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url = 'https://www.googleapis.com/books/v1/volumes?q={http}';

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var itemCount = jsonResponse['totalItems'];
    print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}



//example