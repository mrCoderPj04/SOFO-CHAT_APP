import 'package:flutter/material.dart';
import '../../core/constants/app_theme.dart';
import '../meetings/meeting_room_screen.dart';

class ChatDetailScreen extends StatefulWidget {
  final String title;
  const ChatDetailScreen({super.key, required this.title});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final _msgController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'sender': 'Prince Negi', 'text': 'Hi Rajkamal, let us sync on the WebRTC video grid layout before our 4:00 PM meeting.', 'isMe': false, 'time': '12:40 PM'},
    {'sender': 'Rajkamal Singh', 'text': 'Sure Prince, I tested the screen sharing and audio toggles. Everything is looking sharp.', 'isMe': true, 'time': '12:45 PM'},
  ];

  void _send() {
    final text = _msgController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add({
        'sender': 'Rajkamal Singh',
        'text': text,
        'isMe': true,
        'time': 'Just now',
      });
      _msgController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.call, color: AppTheme.accentCyan),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.videocam, color: AppTheme.accentCyan),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const MeetingRoomScreen(meetingCode: 'pj-418-927')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final m = _messages[index];
                final isMe = m['isMe'] as bool;
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: isMe ? AppTheme.accentBlue : AppTheme.bgCard,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppTheme.borderGlass),
                    ),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                    child: Column(
                      crossAxisAlignment: isMe ? CrossAxisEnd : CrossAxisStart,
                      children: [
                        Text(m['text'] as String, style: const TextStyle(fontSize: 14)),
                        const SizedBox(height: 4),
                        Text(m['time'] as String, style: const TextStyle(fontSize: 10, color: Colors.white70)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.bgSecondary,
              border: Border(top: BorderSide(color: AppTheme.borderGlass)),
            ),
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.attach_file, color: Colors.grey), onPressed: () {}),
                Expanded(
                  child: TextField(
                    controller: _msgController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      filled: true,
                      fillColor: AppTheme.bgPrimary,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: AppTheme.accentCyan,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.black, size: 18),
                    onPressed: _send,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
