// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  Color textColor = Colors.white;

  @override
  Widget build(context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    textColor = data['isDayTime'] ? Colors.black : Colors.white;

    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/${ data['isDayTime'] ? 'day.jpg' : 'night.jpg' }"),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
              child: Column(
                children: [
                  Text(
                    data['locationName'],
                    style: TextStyle(
                      fontSize: 25.0,
                      color: textColor,
                    )
                  ),
                  const SizedBox(height: 5.0),
                  DigitalClock(
                    showSeconds: false,
                    isLive: true,
                    digitalClockTextColor: textColor,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    datetime: data['time'],
                    textScaleFactor: 2.5
                  )
                ],
              ),
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic result = await Navigator.pushNamed(context, '/choose-location');
          if (result != null) {
            setState(() {
              data = {
                'location': result['location'],
                'locationName': result['locationName'],
                'isDayTime': result['isDayTime'],
                'time': result['time'],
              };
            });
          }
        },
        backgroundColor: Colors.purple[100],
        child: const Icon(
          Icons.edit_location,
          color: Colors.white,
        ),
      ),
    );
  }
}