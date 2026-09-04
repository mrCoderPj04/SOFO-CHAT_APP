import 'package:flutter/material.dart';
import '../../core/constants/app_theme.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200'),
            ),
            const SizedBox(height: 16),
            const Text('Rajkamal Singh', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('Lead Architect • Technology', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('EMS Verified: PJ-1001', style: TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 32),
            Card(
              child: Column(
                children: const [
                  ListTile(leading: Icon(Icons.email_outlined), title: Text('rajkamal.singh@pjsofonic.com'), subtitle: Text('Official Email')),
                  Divider(height: 1, color: AppTheme.borderGlass),
                  ListTile(leading: Icon(Icons.badge_outlined), title: Text('Technology Department'), subtitle: Text('Organization')),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red.withOpacity(0.2), foregroundColor: Colors.red),
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
