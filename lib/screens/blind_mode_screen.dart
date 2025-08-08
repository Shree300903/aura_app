import 'package:flutter/material.dart';

class BlindModeScreen extends StatelessWidget {
  const BlindModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blind Mode')),
      body: const Center(
        child: Text(
          'Blind Mode functionality coming soon...',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
