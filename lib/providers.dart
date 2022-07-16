import 'package:flutter/material.dart';
import 'package:weather/models.dart';
import 'package:weather/services.dart';

class WeatherProvider extends ChangeNotifier {
  late Weather weather;
  bool isLoading = false;

  fetchData() async {
    isLoading = true;
    weather = await fetchAPIData();
    isLoading = false;
    notifyListeners();
  }
}
