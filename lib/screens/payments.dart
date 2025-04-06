// lib/screens/payments.dart
import 'package:flutter/material.dart';
import 'package:kodipay_landlord/data/mock_data.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Flatten the list of tenants
    final allTenants = mockProperties.expand((property) => property.tenants).toList();

    // Calculate payment stats
    final totalPaid = allTenants.fold(0.0, (sum, tenant) => sum + (tenant.hasPaidThisMonth ? tenant.rentAmount : 0.0));
    final totalPending = allTenants.fold(0.0, (sum, tenant) => sum + (tenant.hasPaidThisMonth ? 0.0 : tenant.rentAmount));
    // Assume overdue if not paid and lease started before today (April 5, 2025)
    final totalOverdue = allTenants.fold(0.0, (sum, tenant) {
      if (!tenant.hasPaidThisMonth && tenant.leaseStart.isBefore(DateTime.now())) {
        return sum + tenant.rentAmount;
      }
      return sum;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments'),
        backgroundColor: const Color(0xFF92B4EC),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    const Text(
                      'Payment Overview',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
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
              'Payment Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: allTenants.length,
                itemBuilder: (context, index) {
                  final tenant = allTenants[index];
                  final property = mockProperties.firstWhere((p) => p.id == tenant.propertyId);
                  final isOverdue = !tenant.hasPaidThisMonth && tenant.leaseStart.isBefore(DateTime.now());
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
                            'Status: ${tenant.hasPaidThisMonth ? "Paid" : (isOverdue ? "Overdue" : "Pending")}',
                            style: TextStyle(
                              color: tenant.hasPaidThisMonth
                                  ? Colors.green
                                  : (isOverdue ? Colors.red : Colors.orange),
                            ),
                          ),
                        ],
                      ),
                      trailing: !tenant.hasPaidThisMonth
                          ? IconButton(
                              icon: const Icon(Icons.notifications, color: Colors.red),
                              onPressed: () {
                                // TODO: Send payment reminder (future feature)
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Reminder sent to ${tenant.name}')),
                                );
                              },
                            )
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}