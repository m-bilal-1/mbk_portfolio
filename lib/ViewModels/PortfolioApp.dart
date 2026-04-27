
// ─── APP ROOT ─────────────────────────────────────────────────────────────────
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/AppColors.dart';
import '../main.dart';
import 'PortfolioHome.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MBK – Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bg,
        textTheme: GoogleFonts.spaceGroteskTextTheme().apply(
          bodyColor: AppColors.white,
          displayColor: AppColors.white,
        ),
        colorScheme: const ColorScheme.dark(surface: AppColors.bg),
      ),
      home: const PortfolioHome(),
    );
  }
}
