import 'package:movieplanet/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movieplanet/now_showing.dart';
import 'package:movieplanet/recommended.dart';
import 'package:movieplanet/trending.dart';
import 'dart:ui' as ui;
import 'package:movieplanet/profile.dart';
import 'package:movieplanet/posters.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Welcome to the App",
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
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Movie",
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = ui.Gradient.linear(
                      const Offset(0, 0),
                      const Offset(250, 0),
                      [
                        Colors.blue,
                        Colors.purple,
                        Colors.red,
                        Colors.orange,
                      ],
                      [0.0, 0.33, 0.66, 1.0], // required if using more than 2 colors
                    ),
                ),
              ),

              SizedBox(width: 4,),
              Text(
                "Planet",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
            ),
            items:
            Poster.listOfPosters.map((movie) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      movie.url,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 12),
              Text(
                "Top Trending Movies",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Trending.listOfTrending.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildTrendingCard(
                    context,
                    Trending.listOfTrending[index],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 12),
              Text(
                "Recommended Movies",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Recommended.listOfRecommended.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildRecommendedCard(
                    context,
                    Recommended.listOfRecommended[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTrendingCard(BuildContext context, Trending trending) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return MovieDetailsPage(
                name: trending.name,
                genre: trending.genre,
                description: trending.description,
                url: trending.url,
                price: trending.price,
                link: trending.link,
              );
            },
          ),
        );
      },
      child: Card(
        color: Colors.grey[900],
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12.0),
                ),
                child: Image.asset(
                  trending.url,
                  height: 170,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trending.name,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    Text(trending.genre, style: TextStyle(fontSize: 10, color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRecommendedCard(BuildContext context, Recommended recommended) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return MovieDetailsPage(
                name: recommended.name,
                genre: recommended.genre,
                description: recommended.description,
                url: recommended.url,
                price: recommended.price,
                link: recommended.link,
              );
            },
          ),
        );
      },
      child: Card(
        color: Colors.grey[900],
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12.0),
                ),
                child: Image.asset(
                  recommended.url,
                  height: 170,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recommended.name,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    Text(recommended.genre, style: TextStyle(fontSize: 10, color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
