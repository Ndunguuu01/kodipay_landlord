// lib/screens/properties.dart
import 'package:flutter/material.dart';
import 'package:kodipay_landlord/data/mock_data.dart';

class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Properties'),
        backgroundColor: const Color(0xFF92B4EC),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: mockProperties.length,
          itemBuilder: (context, index) {
            final property = mockProperties[index];
            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  property.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(property.address),
                    Text('Units: ${property.totalUnits}'),
                    Text('Occupied: ${property.tenants.length}/${property.totalUnits}'),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  // TODO: Navigate to Property Details page in the future
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF92B4EC),
        onPressed: () {
          Navigator.pushNamed(context, '/add_property');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}