import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Import screens from the correct folder
import 'screens/home_screen.dart';
import 'screens/user_info_screen.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Aura Accessibility App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const SplashScreen(),
      routes: {
        '/home': (_) => const HomeScreen(),
        '/userinfo': (_) => const UserInfoScreen(fromHome: false),
        '/blind': (_) => const BlindModeScreen(),
        '/deaf': (_) => const DeafModeScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUserInfo();
  }

  Future<void> _checkUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');
    final mode = prefs.getString('mode');

    await Future.delayed(const Duration(seconds: 1)); // small delay for splash feel

    if (name != null && name.isNotEmpty && mode != null && mode.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/userinfo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Aura App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
