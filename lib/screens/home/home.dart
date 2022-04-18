import 'package:flutter/material.dart';
import 'package:weather_demo/screens/home/home_weather.dart';
import 'package:weather_demo/screens/home/home_weather_small.dart';

import '../../constant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  bool _expand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: _expand
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(microseconds: 300),
                child: _expand ? const HomeWeatherSmall() : const HomeWeather(),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 140,
                color: const Color(0xFF2C79C1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text(
                        'Sunday | Nov 14',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      margin: const EdgeInsets.only(left: 16, top: 9),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: infoWeather.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 72,
                            height: 104,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${infoWeather[index]['time']}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 9,
                                ),
                                Image.asset(
                                  '${infoWeather[index]['img']}',
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '${infoWeather[index]['temperature']}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '${infoWeather[index]['percent']}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _expand
                  ? InkWell(
                  onTap: () {
                    setState(() {
                      _expand = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
                    color: const Color(0xFF2C79C1),
                    height: 379,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Forcats for 7 Days',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: forecast.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${forecast[index]['title']}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                          flex: 1,
                                        ),
                                        Image.asset('${forecast[index]['img']}'),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${forecast[index]['percent']}',
                                            style: const TextStyle(
                                                fontSize: 12, color: Colors.white),
                                          ),
                                          flex: 1,
                                        ),
                                        Text(
                                          '${forecast[index]['temperature']}',
                                          style: const TextStyle(
                                              fontSize: 12, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    width: 390,
                                    height: 48,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
              )
                  : InkWell(
                      onTap: () {
                        setState(() {
                          _expand = true;
                        });
                      },
                      child: Ink(
                        width: 167,
                        height: 24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Forcats for 7 Days',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF2C79C1),
                              ),
                            ),
                            Image.asset(
                              'assets/images/ic_arrow.png',
                            ),
                          ],
                        ),
                      ),
                    ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
