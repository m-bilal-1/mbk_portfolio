
// ─── SECTION WRAPPER ─────────────────────────────────────────────────────────
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/AppColors.dart';

class SectionWrapper extends StatelessWidget {
  final String sectionNum;
  final String title;
  final Widget child;

  const SectionWrapper({
    super.key,
    required this.sectionNum,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 700;
    final hPad = isMobile ? 24.0 : 56.0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Row(
            children: [
              Text(
                '$sectionNum/',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 11,
                  color: AppColors.gray,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title.toUpperCase(),
                style: GoogleFonts.bebasNeue(
                  fontSize: isMobile ? 38 : 52,
                  color: AppColors.white,
                  letterSpacing: 4,
                ),
              ),
            ],
          ),
          Container(
            width: 48,
            height: 2,
            margin: const EdgeInsets.only(top: 12, bottom: 40),
            color: AppColors.white,
          ),
          child,
        ],
      ),
    );
  }
}

