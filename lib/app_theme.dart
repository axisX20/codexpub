import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Color(0xFF312C51);
  static const Color secondaryColor = Color(0xFF48426D);
  static const Color supportColor = Color(0xFFF0C38E);
  static const Color buttonColor = Color(0xFFF1AA9B);
  static const Color scaffoldBgColor = Color(0xFF086341); // derived from #86341

  static ThemeData get theme {
    final colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBgColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: const TextStyle(color: supportColor),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black87),
        bodyLarge: TextStyle(color: Colors.black87),
        titleLarge: TextStyle(color: primaryColor),
        labelLarge: TextStyle(color: supportColor),
      ),
    );
  }
}
