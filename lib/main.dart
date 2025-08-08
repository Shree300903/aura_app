import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/blind_mode_screen.dart';
import 'screens/deaf_mode_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auraa Accessibility App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/blind': (context) => const BlindModeScreen(),
        '/deaf': (context) => const DeafModeScreen(),
      },
    );
  }
}
