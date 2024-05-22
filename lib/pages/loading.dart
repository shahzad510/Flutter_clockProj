/// This file contains the implementation of the Loading page.
/// The Loading page is responsible for displaying a loading animation while fetching the current time from the WorldTime API.
/// Once the time is fetched, it navigates to the home page and passes the location, flag, time, and isDaytime information as arguments.
/// The Loading page is a stateful widget that uses an AnimationController to control the loading animation.
/// It also implements the SingleTickerProviderStateMixin to provide the ticker for the AnimationController.
/// The loading animation is displayed using the SpinKitSquareCircle widget from the flutter_spinkit package.
/// The background color of the page is set to Colors.blue[900].
/// 
/// Example usage:
/// 
/// ```dart
/// Navigator.pushReplacementNamed(context, '/loading');
/// ```
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:clockproj/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    setupWorldTime();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  /// Sets up the WorldTime instance and fetches the current time.
  /// The location, flag, time, and isDaytime information are passed as arguments to the home page.
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Karachi', flag: 'Pakistan', url: 'Asia/Karachi');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitSquareCircle(
          color: Colors.white,
          size: 50.0,
          controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
        ),
      ),
    );
  }
}