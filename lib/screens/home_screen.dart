import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _name = '';
  String _mode = '';

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? '';
      _mode = prefs.getString('mode') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auraa Accessibility App'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.person),
          tooltip: 'Edit User Info',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const UserInfoScreen(fromHome: true),
              ),
            ).then((_) => _loadUserInfo()); // refresh after edit
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            if (_name.isNotEmpty)
              Text(
                'Welcome, $_name!',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            if (_mode.isNotEmpty)
              Text(
                'Preferred Mode: $_mode',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            const SizedBox(height: 30),
            const Text(
              'Choose a Mode',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: Colors.indigo,
              ),
              icon: const Icon(Icons.visibility_off),
              label: const Text(
                'Blind Mode',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/blind');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: Colors.deepPurple,
              ),
              icon: const Icon(Icons.hearing_disabled),
              label: const Text(
                'Deaf Mode',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
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
