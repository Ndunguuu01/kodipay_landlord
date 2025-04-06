// lib/models/property.dart
import 'package:kodipay_landlord/models/tenant.dart';

class Property {
  final String id;
  final String name;
  final String address;
  final int totalUnits;
  final List<Tenant> tenants;
  final String? photoUrl; // Add this field for the property photo

  Property({
    required this.id,
    required this.name,
    required this.address,
    required this.totalUnits,
    required this.tenants,
    this.photoUrl, // Optional field
  });
}