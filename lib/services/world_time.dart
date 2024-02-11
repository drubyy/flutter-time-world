import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String locationName;
  dynamic time;
  String flag;
  bool isDayTime = false;

  WorldTime({ required this.location, required this.locationName, this.time, required this.flag });

  Future<void> getTime() async {
    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$location'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      time = DateTime.parse(datetime);
      time = time.add(Duration(hours: int.parse(offset)));
      isDayTime = time.hour > 6 && time.hour < 16 ? true : false;
    } catch (e) {
      // TODO: Handler error here
    }
  }
}