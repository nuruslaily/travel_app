import 'package:flutter/material.dart';
import 'package:travel_app/data/trip_data.dart';
import 'package:intl/intl.dart';

class TripReview extends StatefulWidget {
  final Trip trip;

  const TripReview({super.key, required this.trip});

  @override
  _TripReviewState createState() => _TripReviewState();
}

class _TripReviewState extends State<TripReview> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reviews:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8), // Spacing between title and reviews
            Container(
              height: 200, // Set a fixed height for the scrollable area
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      widget.trip.reviews.map((review) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    review.user,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    DateFormat(
                                      'dd MMM yyyy',
                                    ).format(review.date),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    index < review.rating
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                    size: 16,
                                  );
                                }),
                              ),
                              SizedBox(height: 4),
                              Text(
                                review.review,
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
