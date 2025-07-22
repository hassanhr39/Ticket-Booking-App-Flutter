import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movieplanet/locations.dart';
import 'package:movieplanet/profile.dart';

class CinemaDetails extends StatefulWidget {
  const CinemaDetails({super.key});

  @override
  State<CinemaDetails> createState() => _CinemaDetailsState();
}

class _CinemaDetailsState extends State<CinemaDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cinema Details",
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
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12.0),
            ),
            child: Image.asset(
              "Assets/cinemalahore.jpg",
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Row(children: [SizedBox(width: 12)]),
              SizedBox(height: 10),
              Card(
                color: Colors.grey[900],
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contant Us",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                        Divider(),
                        Row(
                          children: [
                            Icon(Icons.phone_enabled_rounded, color: Colors.white,),
                            SizedBox(width: 5),
                            Text(
                              "Number: 0307 4289720",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_pin, color: Colors.white,),
                            SizedBox(width: 5),
                            Text(
                              "Address: 57 Main Boulevard Gulberg-3, Lahore",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.email_rounded, color: Colors.white,),
                            SizedBox(width: 5),
                            Text(
                              "Email: F2023376172@umt.edu.pk",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width: 12),
                  Text(
                    "Cinema Interior",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              CarouselSlider(
                options: CarouselOptions(
                  height: 110,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  autoPlayInterval: Duration(seconds: 4),
                ),
                items:
                Locations.listOfSeating.map((movie) {
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
                    "Cinema Lounge",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              CarouselSlider(
                options: CarouselOptions(
                  height: 110,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  autoPlayInterval: Duration(seconds: 5),
                ),
                items:
                Locations.listOfLounges.map((movie) {
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
                    "Food & Drinks Court",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              CarouselSlider(
                options: CarouselOptions(
                  height: 110,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  autoPlayInterval: Duration(seconds: 7),
                ),
                items:
                Locations.listOfCourt.map((movie) {
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
            ],
          ),
        ],
      ),
    );
  }
}
