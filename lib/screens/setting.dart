import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = '°C';
    String dropdownValue1 = 'km/h';
    String dropdownValue2 = 'mbar';

    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
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
          height: 766,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      'assets/images/ic_back.png',
                      width: 32,
                      height: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 102,
                  ),
                  const Text(
                    'Setting',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'UNIT',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Temperature unit',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  DropdownButton<String>(
                    iconSize: 0,
                    iconEnabledColor: const Color(0xFF2C79C1),
                    dropdownColor: const Color(0xFF2C79C1),
                    value: dropdownValue,
                    style: const TextStyle(color: Color(0xFFE0E0E0)),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          dropdownValue = newValue!;
                        },
                      );
                    },
                    items: <String>['°C', '°F']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Wind speed unit',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  DropdownButton<String>(
                    iconSize: 0,
                    iconEnabledColor: const Color(0xFF2C79C1),
                    dropdownColor: const Color(0xFF2C79C1),
                    value: dropdownValue1,
                    style: const TextStyle(color: Color(0xFFE0E0E0)),
                    onChanged: (String? newValue) {
                      setState(
                            () {
                          dropdownValue1 = newValue!;
                        },
                      );
                    },
                    items: <String>['km/h', 'mil/h','m/s','kn']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Atmospheric pressure unit',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  DropdownButton<String>(
                    iconSize: 0,
                    iconEnabledColor: const Color(0xFF2C79C1),
                    dropdownColor: const Color(0xFF2C79C1),
                    value: dropdownValue2,
                    style: const TextStyle(color: Color(0xFFE0E0E0)),
                    onChanged: (String? newValue) {
                      setState(
                            () {
                          dropdownValue2 = newValue!;
                        },
                      );
                    },
                    items: <String>['mbar', 'atm','mmHg','inHg','hPa']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                ),
                width: 358,
                height: 32,
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'EXTRA',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'About',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Privacy policy',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
