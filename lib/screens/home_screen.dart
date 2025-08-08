import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auraa Accessibility App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Choose a Mode',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            // Blind Mode Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: Colors.indigo,
              ),
              icon: const Icon(Icons.visibility_off),
              label: const Text('Blind Mode',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              onPressed: () {
                Navigator.pushNamed(context, '/blind');
              },
            ),
            const SizedBox(height: 20),
            // Deaf Mode Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: Colors.deepPurple,
              ),
              icon: const Icon(Icons.hearing_disabled),
              label: const Text('Deaf Mode',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              onPressed: () {
                Navigator.pushNamed(context, '/deaf');
              },
            ),
          ],
        ),
      ),
    );
  }
}
