// ─── FOOTER ───────────────────────────────────────────────────────────────────
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/AppColors.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 28),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '© 2026 Muhammad Bilal Khan',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 11,
              color: AppColors.gray,
              letterSpacing: 1,
            ),
          ),
          Text(
            'BUILT WITH FLUTTER',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 11,
              color: AppColors.gray,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}
