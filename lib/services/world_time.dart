// import 'package: flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

/// A class representing a World Time object.
class WorldTime {
  String location; //location of UI
  String? time; // time in that location
  String flag; // url to as asset flag icon
  String url; // url to API
  bool isDaytime = true;

  /// Constructs a WorldTime object with the given [location], [flag], and [url].
  WorldTime({required this.location, required this.flag, required this.url});

  /// Retrieves the time for the WorldTime object.
  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'cound not get time data';
    }
  }
}
