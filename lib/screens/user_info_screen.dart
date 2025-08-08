import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoScreen extends StatefulWidget {
  final bool fromHome;
  const UserInfoScreen({super.key, this.fromHome = false});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final _formKey = GlobalKey<FormState>();
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

  Future<void> _saveUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _name);
    await prefs.setString('mode', _mode);

    if (widget.fromHome) {
      Navigator.pop(context); // return to home
    } else {
      Navigator.pushReplacementNamed(context, '/home'); // go to home
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
        automaticallyImplyLeading: widget.fromHome,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter your name' : null,
                onChanged: (value) => _name = value,
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _mode.isNotEmpty ? _mode : null,
                decoration: const InputDecoration(labelText: 'Preferred Mode'),
                items: const [
                  DropdownMenuItem(value: 'Blind', child: Text('Blind Mode')),
                  DropdownMenuItem(value: 'Deaf', child: Text('Deaf Mode')),
                ],
                onChanged: (value) => _mode = value ?? '',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please select a mode' : null,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _saveUserInfo();
                  }
                },
                child: const Text('Save & Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
