import 'package:flutter/material.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Details'),
      ),
      body: const Center(
        child: Text(
          'Emergency contact info and SOS features will be here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
