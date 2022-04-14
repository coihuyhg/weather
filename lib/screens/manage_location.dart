import 'package:flutter/material.dart';

import '../json/json.dart';

class ManageLocation extends StatelessWidget {
  const ManageLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    width: 63,
                  ),
                  const Text(
                    'Manage location',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 8, top: 8, bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                width: 326,
                height: 32,
                child: Row(
                  children: [
                    Image.asset('assets/images/ic_search.png'),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Search Your City',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF828282),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: place.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white),
                      width: 326,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${place[index]['location']}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF1B2541),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Image.asset(
                                    '${place[index]['ic']}',
                                    width: 16,
                                    height: 16,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                '${place[index]['temperature']}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF545B70),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                '${place[index]['img']}',
                                width: 32,
                                height: 32,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                '${place[index]['weather']}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF545B70),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
