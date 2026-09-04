import 'package:flutter/material.dart';
import '../../core/constants/app_theme.dart';
import '../chat/chat_detail_screen.dart';

class AgentsScreen extends StatelessWidget {
  const AgentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final agents = [
      {'name': 'Rajkamal Singh', 'id': 'PJ-1001', 'role': 'Lead Architect', 'dept': 'Technology', 'avatar': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100'},
      {'name': 'Prince Negi', 'id': 'PJ-1002', 'role': 'Senior Developer', 'dept': 'Technology', 'avatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100'},
      {'name': 'Archana Verma', 'id': 'PJ-1003', 'role': 'Product Manager', 'dept': 'Product', 'avatar': 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=100'},
      {'name': 'Vikram Malhotra', 'id': 'PJ-1004', 'role': 'DevOps Lead', 'dept': 'IT Support', 'avatar': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100'},
      {'name': 'Ananya Sharma', 'id': 'PJ-1005', 'role': 'UI/UX Designer', 'dept': 'Product & Design', 'avatar': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100'},
      {'name': 'Rohit Joshi', 'id': 'PJ-1006', 'role': 'VP Engineering', 'dept': 'Management', 'avatar': 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('EMS Agents Directory', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: agents.length,
        itemBuilder: (context, index) {
          final a = agents[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  CircleAvatar(radius: 24, backgroundImage: NetworkImage(a['avatar']!)),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisStart,
                      children: [
                        Text(a['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        Text('${a['role']} • ${a['dept']}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        Text('EMS ID: ${a['id']}', style: const TextStyle(fontSize: 11, color: AppTheme.accentCyan)),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline, color: AppTheme.accentCyan),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => ChatDetailScreen(title: a['name']!)),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
