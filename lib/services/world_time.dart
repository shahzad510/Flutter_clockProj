// import 'package: flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';



class WorldTime {

String location; //location of UI
String? time; // time in that location
String flag; // url to as asset flag icon
String url; // url to API
bool isDaytime = true;

WorldTime({required this.location, required this.flag,required this.url});
  Future <void> getTime()  async {
  try {
   Response response  = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url')); 
   Map data = jsonDecode(response.body);
 //  print (data);
 // data properties
  String datetime = data['datetime'];
  // print (datetime);
  String offset = data['utc_offset'].substring(1,3);
  // print (offset);
  // create datetime object


  DateTime now = DateTime.parse(datetime);
  now = now.add (Duration (hours: int.parse(offset)));
  
  //  print (now);
  //  print('shahzad');

  isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
  time = DateFormat.jm().format(now);

  // time = now.toString();
  // print (time);
  
  } catch (e)  {
  print('caught error: $e');
  time = 'cound not get time data';
  }
}



 }
 


