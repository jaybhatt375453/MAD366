import 'package:flutter/material.dart';
import 'face_detection_page.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // Function to save login data to CSV
  Future<void> saveLoginToCsv(String email, String password) async {
    try {
      // Set path to "C:\Users\jay37\Downloads\logins.csv"
      const path = r'C:\Users\jay37\Downloads\logins.csv';
      final file = File(path);

      // Write headers if file doesn't exist
      if (!await file.exists()) {
        await file.writeAsString('Email,Password\n');
      }

      // Append the new data
      await file.writeAsString('$email,$password\n', mode: FileMode.append);

      print('Login saved to $path');
    } catch (e) {
      print('Error saving login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text;
                final password = passwordController.text;

                // Save to CSV file
                await saveLoginToCsv(email, password);

                // Navigate to face detection page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FaceDetectionPage()),
                );
              },
              child: const Text('GO'),
            ),
          ],
        ),
      ),
    );
  }
}


