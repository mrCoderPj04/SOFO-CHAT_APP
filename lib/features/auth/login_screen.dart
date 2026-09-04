import 'package:flutter/material.dart';
import '../../core/constants/app_theme.dart';
import '../dashboard/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _currentStep = 1; // 1: Phone, 2: 4-Digit ID
  final _phoneController = TextEditingController(text: '987654');
  final _codeController = TextEditingController(text: '1122');
  bool _isLoading = false;
  String _errorMessage = '';
  String _verifiedUsername = 'Aman Sharma';
  String _maskedId = '**22';

  void _submitPhone() {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _currentStep = 2;
          _verifiedUsername = _phoneController.text.contains('987654') ? 'Aman Sharma' : 'EMS Employee';
          _maskedId = '**22';
        });
      }
    });
  }

  void _submitVerification() {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) {
        setState(() => _isLoading = false);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const DashboardScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [AppTheme.accentCyan, AppTheme.accentPurple],
                      ),
                    ),
                    child: const Center(
                      child: Icon(Icons.hub, color: Colors.white, size: 32),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'PJSOFONIC CONNECT',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, letterSpacing: 1.5),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Enterprise Chat & WebRTC Meeting Platform',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.accentCyan.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppTheme.accentCyan.withOpacity(0.3)),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.verified_user, color: AppTheme.accentCyan, size: 14),
                        SizedBox(width: 6),
                        Text('PJSOFONIC EMS Single-Sign-On', style: TextStyle(color: AppTheme.accentCyan, fontSize: 11, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),

                  // STEP 1: Phone number
                  if (_currentStep == 1) ...[
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Step 1: Employee Phone Number', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 4),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Enter 6-digit phone (+04 XXXXXX) registered in EMS', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
                          decoration: BoxDecoration(
                            color: AppTheme.bgSecondary,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppTheme.borderGlass),
                          ),
                          child: const Text('+04', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.accentCyan, fontSize: 16)),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _phoneController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '987654',
                              filled: true,
                              fillColor: AppTheme.bgSecondary,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.accentBlue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: _isLoading ? null : _submitPhone,
                        child: _isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text('Continue to Verification', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],

                  // STEP 2: 4-digit ID verification
                  if (_currentStep == 2) ...[
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppTheme.accentCyan.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppTheme.accentCyan.withOpacity(0.2)),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppTheme.accentCyan,
                            child: Icon(Icons.badge, color: Colors.black),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisStart,
                            children: [
                              Text('Welcome, $_verifiedUsername!', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                              Text('EMS ID Hint: $_maskedId', style: const TextStyle(fontSize: 12, color: Colors.white70)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Step 2: 4-Digit Employee ID', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 4),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Enter your 4-digit official EMS Employee ID', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _codeController,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 22, letterSpacing: 10, fontWeight: FontWeight.bold),
                      maxLength: 4,
                      decoration: InputDecoration(
                        hintText: '••••',
                        filled: true,
                        fillColor: AppTheme.bgSecondary,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.accentBlue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: _isLoading ? null : _submitVerification,
                        child: _isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text('Verify & Connect', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () => setState(() => _currentStep = 1),
                      child: const Text('Use a different phone number', style: TextStyle(color: AppTheme.accentCyan)),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
