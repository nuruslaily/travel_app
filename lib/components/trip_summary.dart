import 'package:flutter/material.dart';
import 'package:travel_app/data/trip_data.dart';

class TripSummary extends StatefulWidget {
  final Trip trip;

  const TripSummary({super.key, required this.trip});

  @override
  _TripSummaryState createState() => _TripSummaryState();
}

class _TripSummaryState extends State<TripSummary> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            _expanded
                ? widget.trip.summary
                : "${widget.trip.summary.substring(0, 100)}...",
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ),
        IconButton(
          icon: Icon(
            _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          ),
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
        ),
      ],
    );
  }
}
