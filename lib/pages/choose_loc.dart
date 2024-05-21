/// This file contains the implementation of the ChooseLoc page in the clockproj Flutter application.
/// The ChooseLoc page allows the user to select a location from a list and navigate to the home screen.
/// The page displays a list of locations with their respective flags, and when a location is tapped,
/// the updateTime function is called to fetch the time for that location and navigate back to the home screen.
/// The locations are defined as instances of the WorldTime class, which contains the URL, location name, flag image, and time information.
/// The ChooseLoc page is a stateful widget that maintains the list of locations and handles the UI rendering.
/// It also includes an app bar with a title and a background color, and a ListView.builder widget to display the list of locations.
/// Each location is represented by a Card widget with a ListTile, which shows the location name and flag image.
/// The onTap callback of the ListTile calls the updateTime function with the index of the tapped location.
/// The updateTime function fetches the time for the selected location using the WorldTime instance,
/// and then navigates back to the home screen with the location, flag, time, and isDaytime information.
/// The build function is responsible for rendering the UI of the ChooseLoc page.
/// It sets the background color of the Scaffold, configures the app bar, and builds the ListView.builder widget
/// to display the list of locations.
/// The print statement in the build function is used for debugging purposes.
import 'package:flutter/material.dart';
import 'package:clockproj/services/world_time.dart';

class ChooseLoc extends StatefulWidget {
  const ChooseLoc({super.key});

  @override
  State<ChooseLoc> createState() => _ChooseLocState();
}

class _ChooseLocState extends State<ChooseLoc> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  

  /// Fetches the time for the selected location and navigates back to the home screen.
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop (context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }  

  @override
  Widget build(BuildContext context) {
    print ('build function ran');
    return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 161, 13, 124),
        title: Text(
          'Choose a Location',
           style: TextStyle(color: Colors.white),
          
          ),
        centerTitle: true,
        elevation: 0,        
        ),
      body: ListView.builder(
        itemCount : locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card (
              child: ListTile (
                onTap: () {
                  updateTime(index);
                  //print (locations[index].location);
                },
                title: Text (locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}