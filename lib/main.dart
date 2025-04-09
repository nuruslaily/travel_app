import 'package:flutter/material.dart';
import 'package:travel_app/screens/trip_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // scaffoldBackgroundColor: Color(0xFF1E549F),
        fontFamily: 'poppins',
      ),
      home: TripListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
