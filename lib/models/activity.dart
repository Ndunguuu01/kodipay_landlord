// lib/models/activity.dart
enum ActivityType { payment, maintenance }

class Activity {
  final String id;
  final String title;
  final String subtitle;
  final ActivityType type;
  final String relatedId; 

  Activity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.relatedId,
  });
}