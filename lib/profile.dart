import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'privacy_policy.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('My Profile',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: user == null
          ? Center(
        child: Text("No user data found",
            style: TextStyle(color: Colors.white)),
      )
          : Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white12,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            SizedBox(height: 20),

            Card(
              color: Colors.white10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.white70),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            user.displayName ?? 'Name not set',
                            style:
                            TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.email, color: Colors.white70),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            user.email ?? 'Email not available',
                            style:
                            TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.white70),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Joined on: ${user.metadata.creationTime?.toLocal().toString().split(' ').first ?? 'Unknown'}",
                            style: TextStyle(
                                color: Colors.white70, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return PrivacyPolicyPage();
                    },
                  ),
                );
              },
              icon: Icon(Icons.privacy_tip),
              label: Text("Privacy Policy"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white12,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 45),
              ),
            ),

            SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.settings),
              label: Text("Settings"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white12,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 45),
              ),
            ),

            SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.contact_mail),
              label: Text("Contact Us"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white12,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 45),
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false,
                );
              },
              icon: Icon(Icons.logout),
              label: Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[900],
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                textStyle: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
