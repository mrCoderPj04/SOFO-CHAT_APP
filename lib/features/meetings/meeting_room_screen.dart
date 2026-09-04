import 'package:flutter/material.dart';
import '../../core/constants/app_theme.dart';

class MeetingRoomScreen extends StatefulWidget {
  final String meetingCode;
  const MeetingRoomScreen({super.key, required this.meetingCode});

  @override
  State<MeetingRoomScreen> createState() => _MeetingRoomScreenState();
}

class _MeetingRoomScreenState extends State<MeetingRoomScreen> {
  bool _isMuted = false;
  bool _isVideoOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Meeting: ${widget.meetingCode}', style: const TextStyle(fontSize: 15)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(12),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildVideoTile('Rajkamal Singh (You)', 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300', _isMuted),
                _buildVideoTile('Prince Negi', 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300', false),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: AppTheme.bgSecondary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(_isMuted ? Icons.mic_off : Icons.mic, color: _isMuted ? Colors.red : Colors.white),
                  onPressed: () => setState(() => _isMuted = !_isMuted),
                ),
                IconButton(
                  icon: Icon(_isVideoOff ? Icons.videocam_off : Icons.videocam, color: _isVideoOff ? Colors.red : Colors.white),
                  onPressed: () => setState(() => _isVideoOff = !_isVideoOff),
                ),
                IconButton(
                  icon: const Icon(Icons.screen_share, color: Colors.white),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red, shape: const StadiumBorder()),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Leave'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoTile(String name, String imgUrl, bool isMuted) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderGlass),
        image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Text(name, style: const TextStyle(fontSize: 11, color: Colors.white)),
                  if (isMuted) ...[
                    const SizedBox(width: 4),
                    const Icon(Icons.mic_off, color: Colors.red, size: 12),
                  ]
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
