import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'booking_screen.dart';
import 'package:movieplanet/profile.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class MovieDetailsPage extends StatefulWidget {
  final String name;
  final String genre;
  final String description;
  final String url;
  final double price;
  final String link;

  const MovieDetailsPage({
    super.key,
    required this.name,
    required this.genre,
    required this.description,
    required this.url,
    required this.price,
    required this.link,
  });


  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  int track = 0, quantity = 1;
  bool eight = false, ten = false, six = false;

  List<String> getFormattedDates() {
    final now = DateTime.now();
    final formatter = DateFormat('EEE d');
    return List.generate(7, (index) {
      final date = now.add(Duration(days: index));
      return formatter.format(date);
    });
  }

  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.link);
    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dates = getFormattedDates();
    final screenHeight = MediaQuery.of(context).size.height;
    final total = widget.price * quantity;

    String selectedTime = six
        ? "06:00 PM"
        : eight
        ? "08:00 PM"
        : ten
        ? "10:00 PM"
        : "";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[900],
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            tooltip: 'Profile',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context){
                  return ProfileScreen();
                }),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          YoutubePlayer(
            controller: _youtubeController,
            showVideoProgressIndicator: true,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
            child: Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildText(widget.name, 24, FontWeight.bold),
                    SizedBox(height: 8),
                    buildText("Genre: ${widget.genre}", 16, FontWeight.w500, Colors.red[400]),
                    Divider(color: Colors.white54),
                    buildText(widget.description, 16, FontWeight.normal, Colors.grey[300]),
                    Divider(color: Colors.white54),

                    buildText("Select Date", 16, FontWeight.bold),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dates.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() => track = index);
                            },
                            child: Container(
                              width: 100,
                              margin: EdgeInsets.only(right: 20.0),
                              decoration: BoxDecoration(
                                color: Color(0xffeed51e),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: track == index ? Colors.white : Colors.black,
                                  width: 5.0,
                                ),
                              ),
                              child: Center(
                                child: Text(dates[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    buildText("Select Time", 16, FontWeight.bold),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        timeButton("06:00 PM", six, () {
                          setState(() => {six = true, eight = false, ten = false});
                        }),
                        timeButton("08:00 PM", eight, () {
                          setState(() => {six = false, eight = true, ten = false});
                        }),
                        timeButton("10:00 PM", ten, () {
                          setState(() => {six = false, eight = false, ten = true});
                        }),
                      ],
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child:
                        Row(
                          children: [
                            quantitySelector(),
                            SizedBox(width: 30.0),
                            GestureDetector(
                              onTap: () async {
                                if (selectedTime.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("Please select a time"),
                                  ));
                                  return;
                                }

                                final uid = FirebaseAuth.instance.currentUser?.uid;
                                if (uid == null) return;

                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(uid)
                                    .collection('bookings')
                                    .add({
                                  'movie': widget.name,
                                  'date': dates[track],
                                  'time': selectedTime,
                                  'quantity': quantity,
                                  'totalPrice': total,
                                  'timestamp': Timestamp.now(),
                                });

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => BookingScreen()),
                                );
                              },
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Color(0xffeed51e),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.white, width: 3.0),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Amount : Rs.${total.toStringAsFixed(0)}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Book Now",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildText(String text, double size, FontWeight weight, [Color? color]) {
    return Text(text,
        style: TextStyle(fontSize: size, fontWeight: weight, color: color ?? Colors.white));
  }

  Widget timeButton(String label, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: selected
          ? Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xffeed51e), width: 5.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(label,
              style: TextStyle(
                  color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)),
        ),
      )
          : Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffeed51e), width: 3.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(label,
            style: TextStyle(
                color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget quantitySelector() {
    return Container(
      decoration:
      BoxDecoration(border: Border.all(color: Colors.white, width: 2.5), borderRadius: BorderRadius.circular(20)),
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: () => setState(() => quantity++),
              child: Icon(Icons.add, color: Colors.white)),
          Text(quantity.toString(),
              style: TextStyle(color: Color(0xffeed51e), fontSize: 30, fontWeight: FontWeight.bold)),
          GestureDetector(
              onTap: () {
                if (quantity > 1) setState(() => quantity--);
              },
              child: Icon(Icons.remove, color: Colors.white)),
        ],
      ),
    );
  }
}
