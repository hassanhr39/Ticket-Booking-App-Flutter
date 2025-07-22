import 'package:flutter/material.dart';
import 'package:movieplanet/upcoming.dart';
import 'package:movieplanet/profile.dart';
import 'package:movieplanet/showing.dart'; // Import to switch

class UpComingPage extends StatelessWidget {
  const UpComingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Upcoming Movies",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red[900],
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            tooltip: 'Profile',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ProfileScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Switching Buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => NowShowing()),
                      );
                    },
                    child: const Text("Now Showing"),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900],
                    ),
                    child: const Text("Upcoming"),
                  ),
                ),
              ],
            ),
          ),
          // Movie List
          Expanded(
            child: ListView.builder(
              itemCount: Upcoming.listOfUpcoming.length,
              itemBuilder: (context, index) {
                return buildUpComingCard(
                    context, Upcoming.listOfUpcoming[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildUpComingCard(BuildContext context, Upcoming upcoming) {
  return Card(
    color: Colors.grey[850],
    elevation: 2,
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              upcoming.url,
              height: 120,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  upcoming.name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  upcoming.genre,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
