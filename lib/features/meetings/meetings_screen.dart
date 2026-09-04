import 'package:flutter/material.dart';
import '../../core/constants/app_theme.dart';
import 'meeting_room_screen.dart';

class MeetingsScreen extends StatelessWidget {
  const MeetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meetings', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [AppTheme.accentCyan, AppTheme.accentPurple]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisStart,
                      children: [
                        Text('Instant HD Meeting', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(height: 4),
                        Text('Launch a real-time WebRTC room now', style: TextStyle(color: Colors.black87, fontSize: 12)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const MeetingRoomScreen(meetingCode: 'pj-418-927')),
                      );
                    },
                    child: const Text('Start'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Upcoming Meetings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: AppTheme.accentCyan,
                        child: Icon(Icons.videocam, color: Colors.black),
                      ),
                      title: const Text('Project Discussion & Architecture'),
                      subtitle: const Text('Code: pj-418-927 • 60 mins • Host: Rajkamal'),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: AppTheme.accentBlue),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const MeetingRoomScreen(meetingCode: 'pj-418-927')),
                          );
                        },
                        child: const Text('Join'),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: AppTheme.accentPurple,
                        child: Icon(Icons.schedule, color: Colors.white),
                      ),
                      title: const Text('Daily Engineering Standup'),
                      subtitle: const Text('Code: pj-830-154 • Tomorrow 10:00 AM'),
                      trailing: const Text('Waiting', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
