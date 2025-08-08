import 'package:flutter/material.dart';

class DeafModeScreen extends StatelessWidget {
  const DeafModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deaf Mode')),
      body: const Center(
        child: Text(
          'Deaf Mode functionality coming soon...',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
