import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    fontFamily: GoogleFonts.cairo().fontFamily,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    // primaryColorBrightness: Brightness.light,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.primary,
    ),
  );

  static final ThemeData dark = ThemeData(
    fontFamily: GoogleFonts.cairo().fontFamily,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    // primaryColorBrightness: Brightness.dark,
    colorScheme: const ColorScheme.dark().copyWith(secondary: AppColors.accent),
  );
}
