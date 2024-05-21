import 'package:flutter/material.dart';
import 'package:clockproj/pages/home.dart';
import 'package:clockproj/pages/loading.dart';
import 'package:clockproj/pages/choose_loc.dart'; 

void main() {
  runApp( MaterialApp(
    initialRoute: '/', 

    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLoc(), 
    },
  ));
} 