import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _selectedMode = 'Blind';

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? '';
      _ageController.text = prefs.getString('age') ?? '';
      _phoneController.text = prefs.getString('phone') ?? '';
      _selectedMode = prefs.getString('mode') ?? 'Blind';
    });
  }

  Future<void> _saveUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    await prefs.setString('age', _ageController.text);
    await prefs.setString('phone', _phoneController.text);
    await prefs.setString('mode', _selectedMode);

    if (_selectedMode == 'Blind') {
      Navigator.pushReplacementNamed(context, '/blind');
    } else if (_selectedMode == 'Deaf') {
      Navigator.pushReplacementNamed(context, '/deaf');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _selectedMode,
              items: const [
                DropdownMenuItem(value: 'Blind', child: Text('Blind Mode')),
                DropdownMenuItem(value: 'Deaf', child: Text('Deaf Mode')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedMode = value;
                  });
                }
              },
              decoration: const InputDecoration(labelText: 'Accessibility Mode'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveUserInfo,
              child: const Text('Save & Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

