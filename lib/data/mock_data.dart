// lib/data/mock_data.dart
import 'package:kodipay_landlord/models/activity.dart';
import 'package:kodipay_landlord/models/message.dart';
import 'package:kodipay_landlord/models/property.dart';
import 'package:kodipay_landlord/models/tenant.dart';

// Mock Properties
List<Property> mockProperties = [
  Property(
    id: 'prop_1',
    name: 'Sunset Apartments',
    address: '123 Main St, Nairobi',
    totalUnits: 5,
    tenants: [
      Tenant(
        id: 'tenant_1',
        name: 'Alice Smith',
        contact: '+254 701 234 567',
        propertyId: 'prop_1',
        unit: 'A1',
        rentAmount: 30000,
        leaseStart: DateTime(2024, 1, 1),
        leaseEnd: DateTime(2025, 1, 1),
        hasPaidThisMonth: true,
      ),
      Tenant(
        id: 'tenant_2',
        name: 'Bob Johnson',
        contact: '+254 702 345 678',
        propertyId: 'prop_1',
        unit: 'A2',
        rentAmount: 32000,
        leaseStart: DateTime(2024, 2, 1),
        leaseEnd: DateTime(2025, 2, 1),
        hasPaidThisMonth: false,
      ),
    ],
  ),
  Property(
    id: 'prop_2',
    name: 'Greenview Estate',
    address: '456 Oak Rd, Nairobi',
    totalUnits: 3,
    tenants: [
      Tenant(
        id: 'tenant_3',
        name: 'Charlie Brown',
        contact: '+254 703 456 789',
        propertyId: 'prop_2',
        unit: 'B1',
        rentAmount: 28000,
        leaseStart: DateTime(2024, 3, 1),
        leaseEnd: DateTime(2025, 3, 1),
        hasPaidThisMonth: true,
      ),
    ],
  ),
];

// Mock Messages (used in MessagesScreen)
List<Message> mockMessages = [
  Message(
    id: 'msg_1',
    senderId: 'tenant_1',
    receiverId: 'landlord_1',
    content: 'Hello, I have a maintenance issue in my unit.',
    timestamp: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Message(
    id: 'msg_2',
    senderId: 'landlord_1',
    receiverId: 'tenant_1',
    content: 'Hi Alice, can you please provide more details about the issue?',
    timestamp: DateTime.now().subtract(const Duration(hours: 12)),
  ),
  Message(
    id: 'msg_3',
    senderId: 'tenant_2',
    receiverId: 'landlord_1',
    content: 'I will pay the rent tomorrow, sorry for the delay.',
    timestamp: DateTime.now().subtract(const Duration(hours: 2)),
  ),
];

// Mock Activities (used in LandlordDashboard)
List<Activity> mockActivities = [
  Activity(
    id: 'act_1',
    title: 'Payment Received',
    subtitle: 'Alice Smith paid KES 30,000 for Sunset Apartments, Unit A1',
    type: ActivityType.payment,
    relatedId: 'tenant_1',
  ),
  Activity(
    id: 'act_2',
    title: 'Maintenance Request',
    subtitle: 'Bob Johnson reported an issue in Sunset Apartments, Unit A2',
    type: ActivityType.maintenance,
    relatedId: 'tenant_2',
  ),
  Activity(
    id: 'act_3',
    title: 'Payment Received',
    subtitle: 'Charlie Brown paid KES 28,000 for Greenview Estate, Unit B1',
    type: ActivityType.payment,
    relatedId: 'tenant_3',
  ),
  Activity(
    id: 'act_4',
    title: 'Maintenance Request',
    subtitle: 'Alice Smith reported an issue in Sunset Apartments, Unit A1',
    type: ActivityType.maintenance,
    relatedId: 'tenant_1',
  ),
];