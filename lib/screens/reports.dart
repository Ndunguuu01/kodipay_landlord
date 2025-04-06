// lib/screens/reports.dart
import 'package:flutter/material.dart';
import 'package:kodipay_landlord/data/mock_data.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate financial stats
    final allTenants = mockProperties.expand((property) => property.tenants).toList();
    final totalPaid = allTenants.fold(0.0, (sum, tenant) => sum + (tenant.hasPaidThisMonth ? tenant.rentAmount : 0.0));
    final totalPending = allTenants.fold(0.0, (sum, tenant) => sum + (tenant.hasPaidThisMonth ? 0.0 : tenant.rentAmount));
    final totalOverdue = allTenants.fold(0.0, (sum, tenant) {
      if (!tenant.hasPaidThisMonth && tenant.leaseStart.isBefore(DateTime.now())) {
        return sum + tenant.rentAmount;
      }
      return sum;
    });

    // Calculate occupancy stats
    final totalUnits = mockProperties.fold(0, (sum, property) => sum + property.totalUnits);
    final occupiedUnits = allTenants.length;
    final vacantUnits = totalUnits - occupiedUnits;
    final occupancyRate = (occupiedUnits / totalUnits * 100).toStringAsFixed(1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        backgroundColor: const Color(0xFF92B4EC),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Financial Report',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Paid:'),
                        Text(
                          'KES ${totalPaid.toStringAsFixed(0)}',
                          style: const TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Pending:'),
                        Text(
                          'KES ${totalPending.toStringAsFixed(0)}',
                          style: const TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Overdue:'),
                        Text(
                          'KES ${totalOverdue.toStringAsFixed(0)}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Occupancy Report',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Units:'),
                        Text(totalUnits.toString()),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Occupied Units:'),
                        Text(occupiedUnits.toString()),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Vacant Units:'),
                        Text(vacantUnits.toString()),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Occupancy Rate:'),
                        Text('$occupancyRate%'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement export functionality (e.g., PDF export)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Export feature coming soon')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF92B4EC),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('Export Report'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}