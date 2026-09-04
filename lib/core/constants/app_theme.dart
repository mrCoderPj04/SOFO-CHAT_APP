import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color bgPrimary = Color(0xFF090D16);
  static const Color bgSecondary = Color(0xFF0F172A);
  static const Color bgCard = Color(0xAA1E293B);
  static const Color borderGlass = Color(0x22FFFFFF);
  static const Color borderGlow = Color(0x6600F0FF);

  static const Color accentCyan = Color(0xFF00F0FF);
  static const Color accentBlue = Color(0xFF0284C7);
  static const Color accentPurple = Color(0xFF8B5CF6);

  static const Color statusOnline = Color(0xFF10B981);
  static const Color statusAway = Color(0xFFF59E0B);
  static const Color statusBusy = Color(0xFFEF4444);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bgPrimary,
      primaryColor: accentCyan,
      textTheme: GoogleFonts.plusJakartaSansTextTheme(ThemeData.dark().textTheme),
      appBarTheme: const AppBarTheme(
        backgroundColor: bgSecondary,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardTheme(
        color: bgCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: borderGlass),
        ),
      ),
    );
  }
}
