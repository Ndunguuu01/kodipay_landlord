import 'package:flutter/material.dart';
import 'package:kodipay_landlord/screens/landlord_dashboard.dart';

// Placeholder screens (to be implemented later)
class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Properties')),
      body: const Center(child: Text('Properties Screen')),
    );
  }
}

class TenantsScreen extends StatelessWidget {
  const TenantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tenants')),
      body: const Center(child: Text('Tenants Screen')),
    );
  }
}

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payments')),
      body: const Center(child: Text('Payments Screen')),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Settings Screen')),
    );
  }
}

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Property')),
      body: const Center(child: Text('Add Property Screen')),
    );
  }
}

class AddTenantScreen extends StatelessWidget {
  const AddTenantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Tenant')),
      body: const Center(child: Text('Add Tenant Screen')),
    );
  }
}

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: const Center(child: Text('Reports Screen')),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KodiPay Landlord',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF92B4EC),
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/landlord_dashboard',
      routes: {
        '/landlord_dashboard': (context) => const LandlordDashboard(),
        '/properties': (context) => const PropertiesScreen(),
        '/tenants': (context) => const TenantsScreen(),
        '/payments': (context) => const PaymentsScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/add_property': (context) => const AddPropertyScreen(),
        '/add_tenant': (context) => const AddTenantScreen(),
        '/reports': (context) => const ReportsScreen(),
      },
    );
  }
}