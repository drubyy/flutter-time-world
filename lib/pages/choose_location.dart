import 'package:flutter/material.dart';
import 'package:timeofworld/services/world_time.dart';

class ChooseLocation extends StatelessWidget {
  List<WorldTime> locations = [
    WorldTime(location: 'Europe/London', locationName: 'London', flag: 'uk.png'),
    WorldTime(location: 'Europe/Berlin', locationName: 'Athens', flag: 'greece.png'),
    WorldTime(location: 'Africa/Cairo', locationName: 'Cairo', flag: 'egypt.png'),
    WorldTime(location: 'Africa/Nairobi', locationName: 'Nairobi', flag: 'kenya.png'),
    WorldTime(location: 'America/Chicago', locationName: 'Chicago', flag: 'usa.png'),
    WorldTime(location: 'America/New_York', locationName: 'New York', flag: 'usa.png'),
    WorldTime(location: 'Asia/Seoul', locationName: 'Seoul', flag: 'south_korea.png'),
    WorldTime(location: 'Asia/Jakarta', locationName: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index, context) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();

    Navigator.pop(context, {
      'location': worldTime.location,
      'locationName': worldTime.locationName,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[50],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () => updateTime(index, context),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                  title: Text(locations[index].locationName),
                ),
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.purple[50],
    );
  }
}