import 'package:flutter/material.dart';

/// Classic Japanese restaurant palette for Sushi Delivery.
class AppColors {
  static const Color black = Color(0xFF12161C);
  static const Color ink = Color(0xFF15202B);
  static const Color charcoal = Color(0xFF1E2A36);
  static const Color gray = Color(0xFF7A8490);
  static const Color hidden = Color(0x00000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color paper = Color(0xFFF4F5F7);
  static const Color surface = Color(0xFFFAFBFC);
  static const Color gold = Color(0xFFA68B5B);
  static const Color vermillion = Color(0xFFC13B2A);
  static const Color vermillionDark = Color(0xFF9E2F22);

  // Accent aliases (kept so existing screens keep working)
  static const Color lightOrange = vermillion;
  static const Color lightOrangeGradientHard = Color(0xBCC13B2A);
  static const Color lightOrangeGradientLight = Color(0x54C13B2A);
  static const Color strongOrange = vermillionDark;
  static const Color veryLightOrange = Color(0xFFF3D5D0);
  static const Color very2LightOrange = Color(0xFFF8EAE7);

  // Grays & Backgrounds
  static const Color grayTextInProfile = Color(0xFF8A939E);
  static const Color grayBackgroundProfile = paper;
  static const Color grayBackgroundProfileStrong = Color(0xFFE8EAED);

  // Status Colors
  static const Color greenOpen = Color(0xFF4F9D6E);
  static const Color statusRed = Color(0xFFC13B2A);
}
