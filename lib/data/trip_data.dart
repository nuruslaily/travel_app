import 'package:travel_app/data/trip_itinenary.dart';
import 'package:travel_app/data/trip_review_data.dart';

class Trip {
  final int id;
  final String title;
  final String location;
  final String imageUrl;
  final double rating;
  final double price;
  final String summary;
  final List<String> photos;
  final List<String> include;
  final List<String> exclude;
  final String terms;
  final List<String> paxDetails;
  final int pax;
  final List<TripReview> reviews;
  final List<TripItinenary> itinerary;

  Trip({
    required this.id,
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.summary,
    required this.photos,
    required this.include,
    required this.exclude,
    required this.terms,
    required this.paxDetails,
    required this.pax,
    required this.reviews,
    required this.itinerary,
  });
}

final List<Trip> trips = [
  Trip(
    id: 1,
    title: "Opentrip 3D2N Labuan Bajo - Komodo by Travel Buddies",
    location: "Komodo, West Manggarai, East Nusa Tenggara, Indonesia",
    imageUrl: "assets/images/labuhan_bajo.jpg",
    rating: 4.8,
    price: 2900000.0,
    summary:
        "The dream of travelers while in Indonesia is a trip to Labuan Bajo. This village in East Nusa Tenggara Province also has slick and beautiful tourist destinations, ranging from historical, cultural to natural panoramas. Many tourist destinations that you can visit. One of Labuan Bajo's attractions is the area of ​​endemic animal habitat, namely the Komodo dragons in the Komodo National Park. Inevitably, many tourists are competing to visit to see the beauty of NTT. You see, Komodo Island is the original habitat of the ancient Komodo dragon shelter. Besides, there is Pink Beach as the charm of a paradise beach in Labuan Bajo. This beach is called Pink Beach because the sand is pink, comes from algae and red coral flakes mixed with white sand. Apart from the beauty of its beaches, Pink Beach is also famous for its beautiful underwater life, making it suitable for snorkeling or diving.",
    photos: [
      "assets/images/labuhan_bajo.jpg",
      "assets/images/labuhan_bajo1.jpg",
      "assets/images/labuhan_bajo2.jpg",
      "assets/images/labuhan_bajo3.jpg",
    ],
    include: ["Hotel", "Breakfast", "Tour Guide"],
    exclude: ["Flight", "Personal Expenses"],
    terms: "Non-refundable, rescheduling allowed within 7 days.",
    paxDetails: [
      "✅ Same-day booking available",
      "📅 Must reserve at least 1 day in advance",
    ],
    pax: 1,
    reviews: [
      TripReview(
        user: "John Doe",
        date: DateTime(2021, 10, 10),
        rating: 4.9,
        review:
            "Nice trip with new pandawa ship. The food amazing, toilet was clean, and karaoke all the time. Crew’s hospitality was great for made all guest feeling like home to live on boat.!",
      ),
      TripReview(
        user: "Jane ",
        date: DateTime(2021, 10, 10),
        rating: 4.9,
        review:
            "All is perfect!! Mulai dari penjemputan, dikapal, ditempat wisata sampai pengantaran sungguh luar biasa.",
      ),
    ],
    itinerary: [
      TripItinenary(
        date: "Day 1",
        description: "Labuan Bajo - Rinca Island - Kalong Island",
      ),
      TripItinenary(
        date: "Day 2",
        description: "Padar Island - Komodo Island - Pink Beach",
      ),
      TripItinenary(
        date: "Day 3",
        description: "Manta Point - Kanawa Island - Labuan Bajo",
      ),
    ],
  ),
  Trip(
    id: 2,
    title: "Open Trip Bali by Travel Buddies",
    location: "Baturiti, Tabanan, Bali, Indonesia",
    imageUrl: "assets/images/bali.jpg",
    rating: 4.7,
    price: 2500000.0,
    summary:
        "Enjoy an overland trip to Bali through an open trip with Travel Buddies for 5 days and 4 nights. During the trip, you will visit various famous destinations in Bali, starting from Tanjung Benoa, enjoying the beauty of Melasti Beach, and crossing over to the beautiful Nusa Penida with its blue water. You can also enjoy tranquility at the Lempuyang Temple and Tirta Gangga. This trip is surely suitable for you and your closest friends. What are you waiting for? Book your trip with tiket.com now!",
    photos: [
      "assets/images/bali.jpg",
      "assets/images/bali1.jpg",
      "assets/images/bali2.jpg",
      "assets/images/bali3.jpg",
    ],
    include: ["Hotel", "Breakfast", "Tour Guide"],
    exclude: ["Flight", "Personal Expenses"],
    terms: "Non-refundable, rescheduling allowed within 7 days.",
    paxDetails: [
      "✅ Same-day booking available",
      "📅 Must reserve at least 1 day in advance",
    ],
    pax: 2,
    reviews: [
      TripReview(
        user: "Fahmi",
        date: DateTime(2021, 10, 10),
        review: "Amazing experience!",
        rating: 4.9,
      ),
      TripReview(
        user: "Sunny",
        date: DateTime(2021, 10, 10),
        review: "Loved the hospitality.",
        rating: 4.8,
      ),
    ],
    itinerary: [
      TripItinenary(
        date: "Day 1",
        description: "Arrival in Bali - Tanjung Benoa - Melasti Beach",
      ),
      TripItinenary(
        date: "Day 2",
        description: "Nusa Penida - Lempuyang Temple - Tirta Gangga",
      ),
      TripItinenary(
        date: "Day 3",
        description: "Ubud - Tegalalang Rice Terrace - Tegenungan Waterfall",
      ),
      TripItinenary(
        date: "Day 4",
        description: "Kintamani - Tirta Empul - Tegenungan Waterfall",
      ),
      TripItinenary(date: "Day 5", description: "Departure from Bali"),
    ],
  ),
  Trip(
    id: 3,
    title: "Open Trip Bromo via Malang by Cakra Adventure",
    location: "Sukapura, Probolinggo, East Java, Indonesia",
    imageUrl: "assets/images/bromo.jpg",
    rating: 4.0,
    price: 325000,
    summary:
        "East Java has a myriad of natural attractions that are so beautiful and attractive. You can choose any city and still find unique natural attractions. One of them is Mount Bromo. For those of you who are lovers of natural beauty, Bromo is a tourist destination you cannot miss! The charm of Bromo is indeed extraordinary. The strands of mountains seem to be arranged beautifully on a sea of ​​sand, which is lined with steep rock walls, thus completing the charm of Bromo.",
    photos: [
      "assets/images/bromo.jpg",
      "assets/images/bromo1.jpg",
      "assets/images/bromo2.jpg",
      "assets/images/bromo3.jpg",
    ],
    include: ["Hotel", "Breakfast", "Tour Guide"],
    exclude: ["Flight", "Personal Expenses"],
    terms: "Non-refundable, rescheduling allowed within 7 days.",
    paxDetails: [
      "✅ Same-day booking available",
      "📅 Must reserve at least 1 day in advance",
    ],
    pax: 2,
    reviews: [
      TripReview(
        user: "Douyin",
        date: DateTime(2021, 10, 10),
        review:
            "Ntapppppppp uhuyy selain view nya yg nice, the tour guide was very berry insightful",
        rating: 4.9,
      ),
      TripReview(
        user: "Lisa",
        date: DateTime(2021, 10, 10),
        review:
            "Asyik semua di service betul ga kecewa mantap dah recomend banget nih 😍",
        rating: 4.8,
      ),
    ],
    itinerary: [
      TripItinenary(
        date: "Day 1",
        description: "Arrival in Malang - Coban Rondo Waterfall - Jatim Park 3",
      ),
      TripItinenary(
        date: "Day 2",
        description: "Bromo - Savana - Whispering Sand",
      ),
      TripItinenary(
        date: "Day 3",
        description: "Tumpak Sewu Waterfall - Goa Tetes Waterfall",
      ),
      TripItinenary(date: "Day 4", description: "Departure from Malang"),
    ],
  ),
];
