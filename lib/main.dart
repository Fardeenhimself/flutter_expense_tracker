import 'package:expense_tracker/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kLightColorTheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 244, 151, 142),
);

var kDarkColorTheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 244, 151, 142),
);

void main() {
  runApp(const ExpenseTracker());
}

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        brightness: Brightness.light,
        colorScheme: kLightColorTheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kLightColorTheme.primaryContainer,
          foregroundColor: kLightColorTheme.onPrimaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: kLightColorTheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 5,
          shadowColor: kLightColorTheme.onPrimaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kLightColorTheme.primaryContainer,
            foregroundColor: kLightColorTheme.onPrimaryContainer,
            elevation: 4,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          displayLarge: GoogleFonts.inter(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: kLightColorTheme.primary,
          ),
          displayMedium: GoogleFonts.inter(
            fontSize: 16,
            color: kLightColorTheme.primary,
          ),
          titleLarge: GoogleFonts.pacifico(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
          titleMedium: GoogleFonts.inter(fontSize: 14),
          bodyMedium: GoogleFonts.inter(
            fontSize: 16,
            letterSpacing: 0.5,
            color: kLightColorTheme.primary,
          ),
          labelMedium: GoogleFonts.inter(
            fontSize: 16,
            letterSpacing: 1,
            color: kLightColorTheme.primary,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorTheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kDarkColorTheme.primaryContainer,
          foregroundColor: kDarkColorTheme.onPrimaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: kDarkColorTheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 5,
          shadowColor: kDarkColorTheme.onPrimaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorTheme.primaryContainer,
            foregroundColor: kDarkColorTheme.onPrimaryContainer,
            elevation: 4,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          displayLarge: GoogleFonts.inter(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: kDarkColorTheme.primary,
          ),
          displayMedium: GoogleFonts.inter(
            fontSize: 16,
            color: kDarkColorTheme.primary,
          ),
          titleLarge: GoogleFonts.pacifico(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
          titleMedium: GoogleFonts.inter(fontSize: 14),
          bodyMedium: GoogleFonts.inter(
            fontSize: 16,
            letterSpacing: 0.5,
            color: kDarkColorTheme.primary,
          ),
          labelMedium: GoogleFonts.inter(
            fontSize: 16,
            letterSpacing: 1,
            color: kDarkColorTheme.primary,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: Home(),
    );
  }
}
