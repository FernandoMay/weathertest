import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weather/models.dart';

Future<Weather> fetchAPIData() async {
  Weather result;
  try {
    final response = await http.get(
      Uri.parse(
          "http://api.weatherapi.com/v1/current.json?key=58e602de54c444b5b94204136221507&q=Mexico&aqi=yes"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = Weather.fromJson(item);
    } else {
      throw Exception('Failed to load data from API, ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('err: $e');
  }
  return result;
}
