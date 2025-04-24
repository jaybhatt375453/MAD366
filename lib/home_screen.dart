import 'package:flutter/material.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/logo.png', width: 150, height: 150)),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
            child: const Text('LOGIN'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {}, // Add signup logic here
            child: const Text('SIGNUP'),
          ),
        ],
      ),
    );
  }
}
