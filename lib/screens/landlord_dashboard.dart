// lib/screens/landlord_dashboard.dart
import 'package:flutter/material.dart';
import 'package:kodipay_landlord/data/mock_data.dart';
import 'package:kodipay_landlord/models/activity.dart';

class LandlordDashboard extends StatelessWidget {
  const LandlordDashboard({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  int _calculateTotalTenants() {
    return mockProperties.fold(0, (sum, property) => sum + property.tenants.length);
  }

  double _calculateRentCollected() {
    return mockProperties.fold(0.0, (sum, property) {
      return sum + property.tenants.fold(0.0, (tenantSum, tenant) {
        return tenantSum + (tenant.hasPaidThisMonth ? tenant.rentAmount : 0.0);
      });
    });
  }

  double _calculatePendingPayments() {
    return mockProperties.fold(0.0, (sum, property) {
      return sum + property.tenants.fold(0.0, (tenantSum, tenant) {
        return tenantSum + (tenant.hasPaidThisMonth ? 0.0 : tenant.rentAmount);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            decoration: const BoxDecoration(
              color: Color(0xFF92B4EC),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.black),
                      onPressed: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    'KodiPay Landlord',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.pink,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${_getGreeting()},',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const Text(
                            'John Doe',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildStatCard('Total Properties', mockProperties.length.toString(), Icons.home),
                      const SizedBox(width: 10),
                      _buildStatCard('Total Tenants', _calculateTotalTenants().toString(), Icons.person),
                      const SizedBox(width: 10),
                      _buildStatCard('Rent Collected', 'KES ${_calculateRentCollected().toStringAsFixed(0)}', Icons.attach_money),
                      const SizedBox(width: 10),
                      _buildStatCard('Pending Payments', 'KES ${_calculatePendingPayments().toStringAsFixed(0)}', Icons.warning),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(
                      context,
                      icon: Icons.add_home,
                      label: 'Add Property',
                      onTap: () => Navigator.pushNamed(context, '/add_property'),
                    ),
                    _buildActionButton(
                      context,
                      icon: Icons.person_add,
                      label: 'Add Tenant',
                      onTap: () => Navigator.pushNamed(context, '/add_tenant'),
                    ),
                    _buildActionButton(
                      context,
                      icon: Icons.bar_chart,
                      label: 'View Reports',
                      onTap: () => Navigator.pushNamed(context, '/reports'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Recent Activity',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
  height: 285, // Adjust height as needed
  child: Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    child: ListView.builder(
      shrinkWrap: true, // Still useful to avoid unbounded height issues
      itemCount: mockActivities.length,
      itemBuilder: (context, index) {
        final activity = mockActivities[index];
        return ListTile(
          leading: Icon(
            activity.type == ActivityType.payment
                ? Icons.payment
                : Icons.build,
            color: activity.type == ActivityType.payment
                ? Colors.green
                : Colors.orange,
          ),
          title: Text(activity.title),
          subtitle: Text(activity.subtitle),
          onTap: () {
            if (activity.type == ActivityType.payment) {
              Navigator.pushNamed(context, '/payments');
            } else if (activity.type == ActivityType.maintenance) {
              Navigator.pushNamed(
                context,
                '/messages',
                arguments: activity.relatedId,
              );
            }
          },
        );
      },
    ),
  ),
),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFD6E4FF),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
          onTap: (index) {
            if (index == 1) Navigator.pushNamed(context, '/properties');
            if (index == 2) Navigator.pushNamed(context, '/tenants');
            if (index == 3) Navigator.pushNamed(context, '/payments');
            if (index == 4) Navigator.pushNamed(context, '/settings');
          },
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.black),
            const SizedBox(height: 5),
            Text(label, style: const TextStyle(fontSize: 12)),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context,
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 5),
          Text(label, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}