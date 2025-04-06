// lib/models/tenant.dart
class Tenant {
  final String id;
  final String name;
  final String contact;
  final String propertyId;
  final String unit;
  final double rentAmount;
  final DateTime leaseStart;
  final DateTime leaseEnd;
  final bool hasPaidThisMonth; 

  Tenant({
    required this.id,
    required this.name,
    required this.contact,
    required this.propertyId,
    required this.unit,
    required this.rentAmount,
    required this.leaseStart,
    required this.leaseEnd,
    required this.hasPaidThisMonth,
  });
}