import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movieplanet/home.dart';
import 'package:movieplanet/cinema.dart';
import 'package:movieplanet/showing.dart';
import 'package:movieplanet/booking_screen.dart';
import 'package:movieplanet/coming.dart';
import 'package:movieplanet/showing_new.dart';
import 'package:movieplanet/food_court.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late List<Widget> pages;
  late HomeScreen Homepage;
  late MoviesPage moviesPage;
  late CinemaBranch Cinemas;
  late BookingScreen bookingScreen;
  late FoodCourtScreen foodCourtScreen;

  int currentTabIndex = 0;

  @override
  void initState() {
    Homepage = HomeScreen();
    moviesPage = MoviesPage();
    Cinemas = CinemaBranch();
    bookingScreen = BookingScreen();
    foodCourtScreen = FoodCourtScreen();

    pages = [Homepage, moviesPage, Cinemas, bookingScreen, foodCourtScreen];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        height: 50,
        color: Colors.red,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          Icon(Icons.home, color: Colors.white, size: 30),
          Icon(Icons.movie, color: Colors.white, size: 30),
          Icon(Icons.location_pin, color: Colors.white, size: 30),
          Icon(Icons.confirmation_number, color: Colors.white, size: 30),
          Icon(Icons.emoji_food_beverage, color: Colors.white, size: 30),

        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
