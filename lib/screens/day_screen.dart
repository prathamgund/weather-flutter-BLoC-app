import 'package:flutter/material.dart';

class DayScreen extends StatelessWidget {
  const DayScreen({super.key});

String getGreeting(){
   DateTime now = DateTime.now();
    int hour = now.hour;

    String greeting = '';
    if (hour >= 0 && hour < 12) {
      greeting = 'Good Morning';
    } else if (hour >= 12 && hour < 05) {
      greeting = 'Good Afternoon';
    } else if (hour >= 05 && hour < 09) {
      greeting = 'Good Evening';
    } else {
      greeting = 'Good Night';
    }
    return greeting;
}



  @override
  Widget build(BuildContext context) {
    // Get the current time
   

    // Determine the greeting based on the time
    

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Greeting Example'),
        ),
        body: Center(
          child: Text(
            getGreeting(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
