import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup.dart';
import 'bottomnav.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void login() async {
      try {
        final auth = FirebaseAuth.instance;
        await auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const BottomNav()),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Login failed")),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
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
                const Text('Login', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 30),
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
                  onPressed: login,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red[900]),
                  child: const Text('Login', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen()));
                  },
                  child: const Text("Don't have an account? Sign up", style: TextStyle(color: Colors.white70)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
