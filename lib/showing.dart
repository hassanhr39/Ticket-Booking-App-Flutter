import 'package:flutter/material.dart';
import 'package:movieplanet/now_showing.dart';
import 'package:movieplanet/movie_details.dart';
import 'package:movieplanet/profile.dart';
import 'package:movieplanet/coming.dart'; // Import to switch

class NowShowing extends StatelessWidget {
  const NowShowing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Now Showing",
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
                MaterialPageRoute(builder: (BuildContext context) {
                  return ProfileScreen();
                }),
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900],
                    ),
                    child: const Text("Now Showing"),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => UpComingPage()),
                      );
                    },
                    child: const Text("Upcoming"),
                  ),
                ),
              ],
            ),
          ),
          // Movie List
          Expanded(
            child: ListView.builder(
              itemCount: Current.listOfCurrent.length,
              itemBuilder: (context, index) {
                return BuildShowingCard(context, Current.listOfCurrent[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget BuildShowingCard(BuildContext context, Current nowshowing) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return MovieDetailsPage(
              name: nowshowing.name,
              genre: nowshowing.genre,
              description: nowshowing.description,
              url: nowshowing.url,
              price: nowshowing.price,
              link: nowshowing.link,
            );
          },
        ),
      );
    },
    child: Card(
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
                nowshowing.url,
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
                    nowshowing.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    nowshowing.genre,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
