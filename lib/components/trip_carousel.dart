import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TripCarousel extends StatefulWidget {
  final List<String> photos;

  const TripCarousel({super.key, required this.photos});

  @override
  _TripCarouselState createState() => _TripCarouselState();
}

class _TripCarouselState extends State<TripCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 300,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items:
              widget.photos.map((photo) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    photo,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              widget.photos.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => setState(() => _current = entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == entry.key ? Colors.white : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
