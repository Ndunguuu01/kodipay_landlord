// lib/screens/tenants.dart
import 'package:flutter/material.dart';
import 'package:kodipay_landlord/data/mock_data.dart';

class TenantsScreen extends StatelessWidget {
  const TenantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Flatten the list of tenants from all properties
    final allTenants = mockProperties.expand((property) => property.tenants).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tenants'),
        backgroundColor: const Color(0xFF92B4EC),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: allTenants.length,
          itemBuilder: (context, index) {
            final tenant = allTenants[index];
            final property = mockProperties.firstWhere((p) => p.id == tenant.propertyId);
            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  tenant.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${property.name}, ${tenant.unit}'),
                    Text('Rent: KES ${tenant.rentAmount.toStringAsFixed(0)}'),
                    Text(
                      'Payment Status: ${tenant.hasPaidThisMonth ? "Paid" : "Pending"}',
                      style: TextStyle(
                        color: tenant.hasPaidThisMonth ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  // TODO: Navigate to Tenant Details page in the future
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF92B4EC),
        onPressed: () {
          Navigator.pushNamed(context, '/add_tenant');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}