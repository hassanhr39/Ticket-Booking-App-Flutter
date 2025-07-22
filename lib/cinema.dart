import 'package:flutter/material.dart';
import 'package:movieplanet/cinema_details.dart';
import 'package:movieplanet/profile.dart';

class CinemaBranch extends StatelessWidget {
  const CinemaBranch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cinemas",
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context){
                      return CinemaDetails();
                    } ,
                  ),
                );
              },
              child: Card(
                color: Colors.grey[900],
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12.0),
                        ),
                        child: Image.asset(
                          "Assets/cinemalahore.jpg",
                          height: 170,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lahore Cinemas",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                            Text(
                              "57 Main Boulevard Gulberg-3, Lahore, Punjab",
                              style: TextStyle(fontSize: 10, color: Colors.white),

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
      ),
    );
  }
}
