import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'login.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() async {
    await Future.delayed(Duration(seconds: 5));
    final prefs = await SharedPreferences.getInstance();
    bool? onboardingSeen = prefs.getBool('onboardingSeen');

    if (onboardingSeen == null || onboardingSeen == false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnboardingScreen1()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/back1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Welcome text
              Text(
                'Welcome to',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(height: 8),

              // Movie Planet (logo style)
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
                          Offset(0, 0),
                          Offset(250, 0),
                          [
                            Colors.blue,
                            Colors.purple,
                            Colors.red,
                            Colors.orange,
                          ],
                          [0.0, 0.33, 0.66, 1.0],
                        ),
                    ),
                  ),
                  SizedBox(width: 4),
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

              // Loading bar
              SizedBox(
                height: 5,
                width: 80,
                child: LinearProgressIndicator(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
