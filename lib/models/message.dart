// lib/models/message.dart
class Message {
  final String id;
  final String senderId; // Landlord or tenant ID
  final String receiverId; // Landlord or tenant ID
  final String content;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.timestamp,
  });
}