import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/home.dart';
import 'package:weather/providers.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<WeatherProvider>(
      create: (_) => WeatherProvider(),
    ),
  ], child: const MyApp()));
}

Color primaryColor = const Color(0xFFCA4E79);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(primaryColor: primaryColor),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
