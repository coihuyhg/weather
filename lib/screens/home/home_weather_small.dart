import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../manage_location.dart';
import '../setting.dart';

class HomeWeatherSmall extends StatefulWidget {
  const HomeWeatherSmall({Key? key}) : super(key: key);

  @override
  State<HomeWeatherSmall> createState() => _HomeWeatherSmallState();
}

class _HomeWeatherSmallState extends State<HomeWeatherSmall> {
  String _nameCity = "";
  double _temp = 0;
  double _wind = 0;
  int _humidity = 0;
  int _pressure = 0;
  int _rainRate = 0;

  void _getApi() async {
    var client = Client();
    try {
      var response = await client.get(
        Uri.parse('https://api.openweathermap.org/data/2.5/weather?'
            'lat=21.0227788&lon=105.8194541&'
            'appid=6eda658a30b6a7f9d2050af7a8fb2d72&units=metric'),
      );
      var currentWeather = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var name = currentWeather['name'] as String;
      var temp = currentWeather['main']['temp'];
      var wind = currentWeather['wind']['speed'];
      var humidity = currentWeather['main']['humidity'];
      var pressure = currentWeather['main']['pressure'];
      var rainRate = currentWeather['clouds']['all'];
      setState(() {
        _nameCity = name;
        _temp = temp;
        _wind = wind;
        _humidity = humidity;
        _pressure = pressure;
        _rainRate = rainRate;
      });
    } finally {
      client.close();
    }
  }

  @override
  void initState() {
    super.initState();
    _getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 36, right: 16),
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF62B8F6), Color(0xFF2C79C1)],
        ),
      ),
      width: 358,
      height: 353,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ManageLocation(),
                      ));
                },
                icon: Image.asset(
                  'assets/images/ic_plus.png',
                  width: 32,
                  height: 32,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 61,
                height: 32,
                child: Column(
                  children: [
                    Text(
                      _nameCity,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                          ),
                          width: 8,
                          height: 8,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(width: 1, color: Colors.white),
                          ),
                          width: 8,
                          height: 8,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(width: 1, color: Colors.white),
                          ),
                          width: 8,
                          height: 8,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              PopupMenuButton(
                icon: Image.asset(
                  'assets/images/ic_menu.png',
                  width: 32,
                  height: 32,
                  color: Colors.white,
                ),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    child: Text(
                      "Share",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF1B2541),
                      ),
                    ),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF1B2541),
                      ),
                    ),
                    value: 1,
                    onTap: () {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const Setting();
                            },
                          ),
                        );
                      });
                    },
                  ),
                ],
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/image.png',
                width: 160,
                height: 160,
              ),
              const SizedBox(
                width: 26,
              ),
              Column(
                children: [
                  const Text(
                    'Sunday | Nov 14',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    '$_temp°',
                    style: const TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Heavy rain',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white),
              ),
            ),
            width: 326,
            height: 105,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/ic_location.png',
                      width: 32,
                      height: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$_wind km/h',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                        const Text(
                          'Wind',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/ic_weather-rain.png',
                      width: 32,
                      height: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$_rainRate%',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                        const Text(
                          'Chance of rain',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/ic_temperature.png',
                      width: 32,
                      height: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$_pressure mbar',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                        const Text(
                          'Pressure',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/ic_water.png',
                      width: 32,
                      height: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$_humidity%',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                        const Text(
                          'Humidity 83%',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
