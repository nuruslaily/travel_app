import 'package:flutter/material.dart';
import 'package:travel_app/data/trip_data.dart';

class ItineraryModal extends StatelessWidget {
  final Trip trip;
  const ItineraryModal({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Itinerary',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: trip.itinerary.length,
              itemBuilder: (context, index) {
                final item = trip.itinerary[index];
                return TimelineTile(
                  date: item.date,
                  description: item.description,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineTile extends StatelessWidget {
  final String date;
  final String description;
  const TimelineTile({
    super.key,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Wrap(
        children: [
          Column(
            children: [
              Icon(Icons.circle, size: 12, color: Colors.blue),
              Container(width: 2, height: 50, color: Colors.blue),
            ],
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(description),
            ],
          ),
        ],
      ),
    );
  }
}
