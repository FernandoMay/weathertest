import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/main.dart';
import 'package:weather/providers.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool american = false;

  @override
  void initState() {
    super.initState();
    final weather = Provider.of<WeatherProvider>(context, listen: false);
    weather.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<WeatherProvider>(context);

    return Scaffold(
      body: SafeArea(
          child: data.isLoading
              ? Center(
                  child: const CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 28.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.track_changes_outlined,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            "Your Location Now",
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${data.weather.location.name}, ${data.weather.location.region}, ${data.weather.location.country}",
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data.weather.location.localtime,
                        style: TextStyle(
                            color: Colors.grey.shade400, fontSize: 12.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 64.0,
                        backgroundColor: data.weather.current.isDay == 0
                            ? Colors.orange
                            : Colors.cyan,
                        backgroundImage: NetworkImage(
                            "http:${data.weather.current.condition.icon}"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${data.weather.current.condition.text}, ",
                            style: TextStyle(
                                color: Colors.blue.shade800, fontSize: 15.0),
                          ),
                          Text(
                            data.weather.current.condition.code.toString(),
                            style: TextStyle(
                                color: Colors.blue.shade800, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "SI",
                            style: TextStyle(
                              color: Colors.green.shade700,
                            ),
                          ),
                          Switch(
                            activeColor: Colors.blue.shade700,
                            inactiveThumbColor: Colors.green.shade700,
                            inactiveTrackColor: Colors.green.shade400,
                            value: american,
                            onChanged: (value) {
                              setState(() {
                                american = value;
                              });
                            },
                          ),
                          Text(
                            "AM",
                            style: TextStyle(
                              color: Colors.blue.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.temple_buddhist,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(width: 6.0),
                                Text(
                                  american
                                      ? data.weather.current.tempF.toString()
                                      : data.weather.current.tempC.toString(),
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                                Text(
                                  american ? " °F " : " °C ",
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wind_power,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(width: 6.0),
                                Text(
                                  american
                                      ? data.weather.current.windMph.toString()
                                      : data.weather.current.windKph.toString(),
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                                Text(
                                  american ? " mph " : " kph ",
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.precision_manufacturing_sharp,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(width: 6.0),
                                Text(
                                  american
                                      ? data.weather.current.pressureIn
                                          .toString()
                                      : data.weather.current.pressureMb
                                          .toString(),
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                                Text(
                                  american ? " in " : " mb ",
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.cloudy_snowing,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(width: 6.0),
                                Text(
                                  american
                                      ? data.weather.current.precipIn.toString()
                                      : data.weather.current.precipMm
                                          .toString(),
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                                Text(
                                  american ? " in " : " mm ",
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 28.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wind_power,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(width: 6.0),
                                Text(
                                  american
                                      ? data.weather.current.gustMph.toString()
                                      : data.weather.current.gustKph.toString(),
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                                Text(
                                  american ? " mph " : " kmh ",
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.sensor_window,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(width: 6.0),
                                Text(
                                  american
                                      ? data.weather.current.feelslikeF
                                          .toString()
                                      : data.weather.current.feelslikeC
                                          .toString(),
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                                Text(
                                  american ? " °F " : " °C ",
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 28.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.visibility,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(width: 6.0),
                                Text(
                                  american
                                      ? data.weather.current.visMiles.toString()
                                      : data.weather.current.visKm.toString(),
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                                Text(
                                  american ? " mi " : " km ",
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.heat_pump,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(width: 6.0),
                                Text(
                                  "${data.weather.current.humidity.toString()} %",
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.cloud,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(width: 6.0),
                                Text(
                                  "${data.weather.current.cloud.toString()} %",
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.unarchive,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(width: 6.0),
                                Text(
                                  "${data.weather.current.uv.toString()} %",
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wind_power_sharp,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(width: 6.0),
                                Text(
                                  "${data.weather.current.windDegree.toString()} °",
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.directions,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(width: 6.0),
                                Text(
                                  data.weather.current.windDir,
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
    );
  }
}
