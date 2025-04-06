// lib/main.dart
import 'package:flutter/material.dart';
import 'package:kodipay_landlord/screens/landlord_dashboard.dart';
import 'package:kodipay_landlord/screens/properties.dart';
import 'package:kodipay_landlord/screens/tenants.dart';
import 'package:kodipay_landlord/screens/payments.dart';
import 'package:kodipay_landlord/screens/settings.dart';
import 'package:kodipay_landlord/screens/add_property.dart';
import 'package:kodipay_landlord/screens/add_tenant.dart';
import 'package:kodipay_landlord/screens/reports.dart';

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