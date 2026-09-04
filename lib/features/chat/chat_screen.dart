import 'package:flutter/material.dart';
import '../../core/constants/app_theme.dart';
import 'chat_detail_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      {'name': 'Prince Negi', 'msg': 'Sure Rajkamal, let us sync on WebRTC grid layout.', 'time': '12:45 PM', 'unread': 1, 'avatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100'},
      {'name': 'Development Team', 'msg': 'Prince Negi: STOMP signaling is operating seamlessly.', 'time': '11:30 AM', 'unread': 0, 'avatar': 'https://ui-avatars.com/api/?name=Development+Team'},
      {'name': 'Archana Verma', 'msg': 'Meeting invitation sent for 4:00 PM.', 'time': '10:15 AM', 'unread': 0, 'avatar': 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=100'},
      {'name': 'Project Alpha', 'msg': 'Archana Verma: Next sprint milestones uploaded.', 'time': 'Yesterday', 'unread': 0, 'avatar': 'https://ui-avatars.com/api/?name=Project+Alpha'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.group_add), onPressed: () {}),
        ],
      ),
      body: ListView.separated(
        itemCount: chats.length,
        separatorBuilder: (_, __) => const Divider(color: AppTheme.borderGlass, height: 1),
        itemBuilder: (context, index) {
          final c = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(c['avatar'] as String),
            ),
            title: Text(c['name'] as String, style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text(c['msg'] as String, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.grey)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisEnd,
              children: [
                Text(c['time'] as String, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                if ((c['unread'] as int) > 0) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(color: AppTheme.accentCyan, shape: BoxShape.circle),
                    child: Text('${c['unread']}', style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ]
              ],
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ChatDetailScreen(title: c['name'] as String)),
              );
            },
          );
        },
      ),
    );
  }
}
