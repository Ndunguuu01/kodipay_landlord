// lib/screens/settings.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color(0xFF92B4EC),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Landlord Profile',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Name:'),
                        Text('John Doe', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Email:'),
                        Text('john.doe@example.com', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Phone:'),
                        Text('+254 111 222 333', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Implement edit profile functionality
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Edit profile feature coming soon')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF92B4EC),
                        ),
                        child: const Text('Edit Profile'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'App Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildSettingsItem('Notifications', 'Enabled'),
            _buildSettingsItem('Language', 'English'),
            _buildSettingsItem('Currency', 'KES'),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(String label, String value) {
    return SizedBox(
      height: 60.0,
      child: Card(
        color: const Color(0xFFD6E4FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              Text(value, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}