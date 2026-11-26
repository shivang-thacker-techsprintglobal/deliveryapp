import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static TextTheme _textTheme(TextTheme base, Color bodyColor) {
    final display = GoogleFonts.playfairDisplayTextTheme(base).apply(
      bodyColor: bodyColor,
      displayColor: bodyColor,
    );
    final body = GoogleFonts.sourceSans3TextTheme(base).apply(
      bodyColor: bodyColor,
      displayColor: bodyColor,
    );
    return body.copyWith(
      displayLarge: display.displayLarge?.copyWith(fontWeight: FontWeight.w700),
      displayMedium: display.displayMedium?.copyWith(fontWeight: FontWeight.w700),
      displaySmall: display.displaySmall?.copyWith(fontWeight: FontWeight.w700),
      headlineLarge: display.headlineLarge?.copyWith(fontWeight: FontWeight.w700),
      headlineMedium: display.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
      headlineSmall: display.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
      titleLarge: display.titleLarge?.copyWith(fontWeight: FontWeight.w600),
      titleMedium: body.titleMedium?.copyWith(fontWeight: FontWeight.w600, letterSpacing: 0.2),
      titleSmall: body.titleSmall?.copyWith(fontWeight: FontWeight.w600),
      labelLarge: body.labelLarge?.copyWith(fontWeight: FontWeight.w600, letterSpacing: 0.4),
    );
  }

  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.vermillion,
      scaffoldBackgroundColor: AppColors.paper,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.vermillion,
        primary: AppColors.vermillion,
        secondary: AppColors.gold,
        surface: AppColors.surface,
        brightness: Brightness.light,
      ),
    );

    return base.copyWith(
      textTheme: _textTheme(base.textTheme, AppColors.ink),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.ink,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: GoogleFonts.playfairDisplay(
          color: AppColors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.surface,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.vermillion,
          foregroundColor: AppColors.white,
          elevation: 0,
          // Finite width — Size.fromHeight(infinity) breaks ListTile trailing buttons.
          minimumSize: const Size(64, 48),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: GoogleFonts.sourceSans3(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.vermillion,
          side: const BorderSide(color: AppColors.vermillion, width: 1.5),
          minimumSize: const Size(64, 48),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: GoogleFonts.sourceSans3(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        hintStyle: GoogleFonts.sourceSans3(color: AppColors.gray),
        prefixIconColor: AppColors.gray,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFD9DEE5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.vermillion, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFD9DEE5)),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFFE6E9EE)),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xFFE6E9EE),
        thickness: 1,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.vermillion,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.vermillion,
        foregroundColor: AppColors.white,
      ),
    );
  }

  static ThemeData get dark {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.vermillion,
      scaffoldBackgroundColor: AppColors.ink,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.vermillion,
        primary: AppColors.vermillion,
        secondary: AppColors.gold,
        surface: AppColors.charcoal,
        brightness: Brightness.dark,
      ),
    );

    return base.copyWith(
      textTheme: _textTheme(base.textTheme, AppColors.white),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.charcoal,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.playfairDisplay(
          color: AppColors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
