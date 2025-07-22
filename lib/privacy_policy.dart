import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Privacy Policy", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[900],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy for Movie Planet",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              Text(
                "1. Introduction",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Welcome to Movie Planet. Your privacy is important to us. This page explains how we handle your personal information.",
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),

              SizedBox(height: 15),
              Text(
                "2. Information We Collect",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "- Name\n- Email\n- Booking details (movie, time, seats)\n- App usage data (for analytics)",
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),

              SizedBox(height: 15),
              Text(
                "3. How We Use Your Information",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "We use your information to process bookings, provide support, personalize your experience, and improve the app.",
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),

              SizedBox(height: 15),
              Text(
                "4. Data Security",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Your data is secured using industry-standard practices. We do not share your data with third parties without your permission.",
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),

              SizedBox(height: 15),
              Text(
                "5. Changes to This Policy",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "This policy may be updated. We'll notify you about significant changes in the app or via email.",
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),

              SizedBox(height: 15),
              Text(
                "6. Contact Us",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "If you have any questions, contact us at support@movieplanet.com.",
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),

              SizedBox(height: 30),
              Center(
                child: Text(
                  "Last updated: July 2025",
                  style: TextStyle(color: Colors.white38),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
