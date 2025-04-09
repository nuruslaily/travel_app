import 'package:flutter/material.dart';
import 'package:travel_app/components/trip_carousel.dart';
import 'package:travel_app/components/trip_expansion.dart';
import 'package:travel_app/components/trip_itinerary.dart';
import 'package:travel_app/components/trip_reviews.dart';
import 'package:travel_app/components/trip_summary.dart';
import 'package:travel_app/data/trip_data.dart';

class TripDetailScreen extends StatelessWidget {
  final Trip trip;
  const TripDetailScreen({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trip.title),
        centerTitle: true,
        backgroundColor: Color(0xFF1E549F),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TripCarousel(photos: trip.photos),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rating: ${trip.rating}/5 From (${trip.reviews.length} reviews)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TripSummary(trip: trip),
                  SizedBox(height: 10),
                  FilledButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ItineraryModal(trip: trip);
                        },
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xFF1E549F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    child: Text(
                      'View Itinerary',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  TripExpansion(trip: trip),
                  SizedBox(height: 10),
                  TripReview(trip: trip),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
