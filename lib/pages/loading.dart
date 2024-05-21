import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'package:http/http.dart';
// import 'dart:convert';
import 'package:clockproj/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin  {
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
//String time = 'loading';

void setupWorldTime () async {
  WorldTime instance = WorldTime(location: 'Karachi', flag: 'Pakistan', url: 'Asia/Karachi');
  await instance.getTime();

  Navigator.pushReplacementNamed (context, '/home', arguments : {

    'location':instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isDaytime': instance.isDaytime,

  });
  //print (instance.time);

  //setState(() {
  //  time = instance.time!;
  
  //});
}

//@override
  //void initState() {
    // super.initState();
     //setupWorldTime();
 // }

  @override
  Widget build(BuildContext context) {
    return  Scaffold (
      backgroundColor: Colors.blue[900],
      body: Center (
      child: SpinKitSquareCircle(
  color: Colors.white,
  size: 50.0,
  controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
),


      ),
    );
  }
}