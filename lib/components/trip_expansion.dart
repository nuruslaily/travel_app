import 'package:flutter/material.dart';
import 'package:travel_app/data/trip_data.dart';
import 'package:intl/intl.dart';

class TripExpansion extends StatefulWidget {
  final Trip trip;

  const TripExpansion({super.key, required this.trip});

  @override
  _TripExpansionState createState() => _TripExpansionState();
}

class _TripExpansionState extends State<TripExpansion> {
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  double totalPrice = 0.0;
  int ticketCount = 1;

  final ButtonStyle buttonStyle = FilledButton.styleFrom(
    backgroundColor: Color(0xFF1E549F),
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<DateTime> availableDates = List.generate(
      7,
      (index) => now.add(Duration(days: index)),
    );

    return ExpansionTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      collapsedBackgroundColor: Colors.grey[200],
      backgroundColor: Colors.grey[200],
      textColor: Colors.grey[800],
      title: Text(
        "Package Details",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[800],
        ),
      ),
      subtitle: Text(
        "Starts from ${NumberFormat('#,##0', 'id_ID').format(widget.trip.price)}",
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFF1E549F),
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        SizedBox(height: 10),
        Text(widget.trip.paxDetails.join(", "), style: TextStyle(fontSize: 14)),
        SizedBox(height: 10),
        Text(
          "Includes: ${widget.trip.include.join(", ")}",
          style: TextStyle(fontSize: 14),
        ),
        Text(
          "Excludes: ${widget.trip.exclude.join(", ")}",
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 10),
        Text(
          "Terms & Conditions:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(widget.trip.terms, style: TextStyle(fontSize: 14)),
        SizedBox(height: 10),
        Text(
          "Visit Date:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Wrap(
          children:
              availableDates.map((date) {
                bool isSelected =
                    selectedStartDate != null && selectedStartDate == date;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor:
                          isSelected ? Colors.red : Color(0xFF1E549F),
                      minimumSize: Size(88, 36),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedStartDate = date;
                        selectedEndDate = null;
                        totalPrice = widget.trip.price * ticketCount;
                      });
                    },
                    child: Text(
                      DateFormat('EE, dd MMM').format(date),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
        ),
        SizedBox(height: 10),

        // CHECK AVAILABLE DATE BUTTON
        FilledButton.icon(
          icon: const Icon(Icons.calendar_today, color: Colors.white),
          style: buttonStyle,
          onPressed: () async {
            DateTimeRange? picked = await showDateRangePicker(
              context: context,
              firstDate: now,
              lastDate: now.add(Duration(days: 365)),
              builder: (BuildContext context, Widget? child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: child,
                    ),
                  ],
                );
              },
            );
            if (picked != null) {
              setState(() {
                selectedStartDate = picked.start;
                selectedEndDate = picked.end;
                int days = picked.end.difference(picked.start).inDays + 1;
                totalPrice = widget.trip.price * days * ticketCount;
              });
            }
          },
          label: Text(
            "Check Available Date",
            style: TextStyle(color: Colors.white),
          ),
        ),

        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tickets: ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.remove, color: Color(0xFF1E549F)),
              onPressed: () {
                setState(() {
                  if (ticketCount > 1) ticketCount--;
                  if (selectedStartDate != null && selectedEndDate != null) {
                    int days =
                        selectedEndDate!.difference(selectedStartDate!).inDays +
                        1;
                    totalPrice = widget.trip.price * days * ticketCount;
                  } else {
                    totalPrice = widget.trip.price * ticketCount;
                  }
                });
              },
            ),
            Text(ticketCount.toString(), style: TextStyle(fontSize: 16)),
            IconButton(
              icon: Icon(Icons.add, color: Color(0xFF1E549F)),
              onPressed: () {
                setState(() {
                  ticketCount++;
                  if (selectedStartDate != null && selectedEndDate != null) {
                    int days =
                        selectedEndDate!.difference(selectedStartDate!).inDays +
                        1;
                    totalPrice = widget.trip.price * days * ticketCount;
                  } else {
                    totalPrice = widget.trip.price * ticketCount;
                  }
                });
              },
            ),
          ],
        ),
        Text(
          "Validity Period: ",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        if (selectedStartDate != null)
          Text(
            "${DateFormat('dd MMM yyyy').format(selectedStartDate!)}"
            "${selectedEndDate != null && selectedStartDate != selectedEndDate ? " to ${DateFormat('dd MMM yyyy').format(selectedEndDate!)}" : ""}\n",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        Text(
          "Total Price ($ticketCount pax):",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          "IDR ${NumberFormat('#,##0', 'id_ID').format(totalPrice)}",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        SizedBox(height: 10),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: Color(0xFF1E549F),
            minimumSize: Size(double.infinity, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {},
          child: Text(
            "Book Now",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
