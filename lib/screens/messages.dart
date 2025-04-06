// lib/screens/messages.dart
import 'package:flutter/material.dart';
import 'package:kodipay_landlord/data/mock_data.dart';

class MessagesScreen extends StatefulWidget {
  final String? tenantId; // Optional tenant ID to open a specific conversation

  const MessagesScreen({super.key, this.tenantId});

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  String? _selectedTenantId;
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedTenantId = widget.tenantId; // Set the initial tenant ID if provided
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage(String receiverId) {
    if (_messageController.text.isNotEmpty) {
      // TODO: Add the message to the data source (mock data or backend)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Message sent to tenant ID: $receiverId')),
      );
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get all tenants for the conversation list
    final allTenants = mockProperties.expand((property) => property.tenants).toList();

    // If a tenant is selected, show the conversation; otherwise, show the list of tenants
    if (_selectedTenantId != null) {
      final selectedTenant = allTenants.firstWhere((tenant) => tenant.id == _selectedTenantId);
      // Filter messages for this tenant
      final conversation = mockMessages
          .where((message) =>
              (message.senderId == _selectedTenantId && message.receiverId == 'landlord_1') ||
              (message.senderId == 'landlord_1' && message.receiverId == _selectedTenantId))
          .toList()
        ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

      return Scaffold(
        appBar: AppBar(
          title: Text(selectedTenant.name),
          backgroundColor: const Color(0xFF92B4EC),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: conversation.length,
                itemBuilder: (context, index) {
                  final message = conversation[index];
                  final isSentByLandlord = message.senderId == 'landlord_1';
                  return Align(
                    alignment: isSentByLandlord ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: isSentByLandlord ? const Color(0xFF92B4EC) : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: isSentByLandlord ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          Text(
                            message.content,
                            style: TextStyle(color: isSentByLandlord ? Colors.white : Colors.black),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')}',
                            style: TextStyle(
                              color: isSentByLandlord ? Colors.white70 : Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFF92B4EC)),
                    onPressed: () => _sendMessage(_selectedTenantId!),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Show the list of tenants to start a conversation
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: const Color(0xFF92B4EC),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: allTenants.length,
          itemBuilder: (context, index) {
            final tenant = allTenants[index];
            final property = mockProperties.firstWhere((p) => p.id == tenant.propertyId);
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
                subtitle: Text('${property.name}, ${tenant.unit}'),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  setState(() {
                    _selectedTenantId = tenant.id;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}