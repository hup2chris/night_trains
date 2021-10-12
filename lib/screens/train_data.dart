//import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:html/parser.dart' as parser;
//import 'package:dio/dio.dart';

Map<String, int> arrow = {};

class TrainsData {
  Future getTrainsData() async {
    var decodedData;

    String filej = 'https://hup2.com/flutter/night_trains.php';

    http.Response response = await http.get(Uri.parse(filej),);

    /*if (response.statusCode == 200) {
      decodedData = response.body;
      // decodedData = jsonDecode(response.body);
      print(decodedData);
    }*/

    return decodedData;
  }
}
