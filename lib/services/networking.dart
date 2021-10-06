import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{


  final String url;

  NetworkHelper({this.url});

  Future<dynamic> getData() async {

    // if we want to return a var from function
    // it never happens we only can return
    // Future not var and not Future<var>
    // that's why all functions return a data type specified not a var
    // .

  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
  String data = response.body;

  return jsonDecode(data);
  // double temperature = decodedData['main']['temp'];
  // String name = decodedData['name'];
  // String weatherCondition = decodedData['weather'][0]['main'];
  } else {
  print(response.statusCode);
  }

}


}