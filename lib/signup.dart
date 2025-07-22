import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'bottomnav.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void signUp() async {
      try {
        final auth = FirebaseAuth.instance;
        await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Optionally update the display name
        await auth.currentUser!.updateDisplayName(nameController.text.trim());

        // Navigate to BottomNav
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const BottomNav()),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Sign up failed")),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Sign Up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
        backgroundColor: Colors.red[900],
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Create Account', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 30),
                TextField(
                  controller: nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(labelText: 'Name', labelStyle: TextStyle(color: Colors.white70)),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(labelText: 'Email', labelStyle: TextStyle(color: Colors.white70)),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(labelText: 'Password', labelStyle: TextStyle(color: Colors.white70)),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: signUp,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red[900]),
                  child: const Text('Sign Up', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                  },
                  child: const Text("Already have an account? Login", style: TextStyle(color: Colors.white70)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
