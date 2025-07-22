import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movieplanet/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:movieplanet/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? onboardingSeen = prefs.getBool('onboardingSeen');

  runApp(CinemaApp(showOnboarding: onboardingSeen == null || onboardingSeen == false));
}

class CinemaApp extends StatelessWidget {
  final bool showOnboarding;

  const CinemaApp({super.key, required this.showOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cinema App",
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: Splashscreen(),
    );
  }
}

// ----------------- ONBOARDING SCREEN 1 ------------------
class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("Assets/screen1.jpg", fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.5)),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Welcome to Movie Planet",
                  style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Discover the latest blockbusters, indie gems, and timeless classics — all in one place.",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                      return OnboardingScreen2();
                    }));
                  },
                  child: const Text("Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------- ONBOARDING SCREEN 2 ------------------
class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("Assets/screen2.jpg", fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.5)),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Book Movies Instantly",
                  style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Reserve your seat, pick a showtime, and get your tickets — fast and hassle-free.",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                      return OnboardingScreen3();
                    }));
                  },
                  child: const Text("Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------- ONBOARDING SCREEN 3 ------------------
class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  Future<void> completeOnboarding(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingSeen', true);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("Assets/screen3.jpg", fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.5)),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Enjoy the Big Screen!",
                  style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Get ready for immersive sound, stunning visuals, and a movie night you’ll never forget.",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => completeOnboarding(context),
                  child: const Text("Get Started"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
