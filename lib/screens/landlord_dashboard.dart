import 'package:flutter/material.dart';

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
                      _buildStatCard('Total Properties', '5', Icons.home),
                      const SizedBox(width: 10),
                      _buildStatCard('Total Tenants', '12', Icons.person),
                      const SizedBox(width: 10),
                      _buildStatCard('Rent Collected', 'KES 150,000', Icons.attach_money),
                      const SizedBox(width: 10),
                      _buildStatCard('Pending Payments', 'KES 30,000', Icons.warning),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recent Activity',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        ListTile(
                          leading: Icon(Icons.payment, color: Colors.green),
                          title: Text('Tenant A paid KES 30,000'),
                          subtitle: Text('05/04/2025'),
                        ),
                        ListTile(
                          leading: Icon(Icons.build, color: Colors.orange),
                          title: Text('Maintenance request from Tenant B'),
                          subtitle: Text('04/04/2025'),
                        ),
                      ],
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