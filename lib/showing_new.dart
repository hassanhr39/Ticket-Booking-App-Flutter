import 'package:flutter/material.dart';
import 'package:movieplanet/movie_details.dart';
import 'package:movieplanet/now_showing.dart';
import 'package:movieplanet/upcoming.dart';
import 'package:movieplanet/profile.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  bool isNowShowing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          isNowShowing ? "Now Showing" : "Upcoming Movies",
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
                MaterialPageRoute(builder: (_) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() => isNowShowing = true);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      isNowShowing ? Colors.red[900] : Colors.grey[700],
                    ),
                    child: Text("Now Showing", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() => isNowShowing = false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      !isNowShowing ? Colors.red[900] : Colors.grey[700],
                    ),
                    child: Text("Upcoming", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: isNowShowing
                ? ListView.builder(
              itemCount: Current.listOfCurrent.length,
              itemBuilder: (context, index) {
                return BuildShowingCard(
                    context, Current.listOfCurrent[index]);
              },
            )
                : ListView.builder(
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

Widget BuildShowingCard(BuildContext context, Current nowshowing) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailsPage(
            name: nowshowing.name,
            genre: nowshowing.genre,
            description: nowshowing.description,
            url: nowshowing.url,
            price: nowshowing.price,
            link: nowshowing.link,
          ),
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
                  Text(nowshowing.name,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(height: 5),
                  Text(nowshowing.genre,
                      style: TextStyle(
                          fontSize: 12, color: Colors.white),
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
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
                Text(upcoming.name,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(height: 5),
                Text(upcoming.genre,
                    style:
                    TextStyle(fontSize: 12, color: Colors.white),
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
