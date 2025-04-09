import 'package:flutter/material.dart';
import 'package:travel_app/components/trip_card.dart';
import 'package:travel_app/screens/trip_detail_screen.dart';
import '../data/trip_data.dart';

class TripListScreen extends StatelessWidget {
  const TripListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TRAVEL APP"),
        centerTitle: true,
        backgroundColor: Color(0xFF1E549F),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TripDetailScreen(trip: trip),
                ),
              );
            },
            child: TripCard(trip: trip),
          );
        },
      ),
    );
  }
}
