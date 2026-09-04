import 'package:flutter/material.dart';
import 'core/constants/app_theme.dart';
import 'features/auth/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PjsofonicConnectApp());
}

class PjsofonicConnectApp extends StatelessWidget {
  const PjsofonicConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PJSOFONIC Connect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const LoginScreen(),
    );
  }
}
