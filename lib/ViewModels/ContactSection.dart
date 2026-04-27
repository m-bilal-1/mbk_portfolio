// ─── CONTACT SECTION ─────────────────────────────────────────────────────────
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/PortfolioData.dart';
import '../Utils/AppColors.dart';
import 'SectionWrapper.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      color: AppColors.surface,
      child: SectionWrapper(
        sectionNum: '06',
        title: "Let's Connect",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: isMobile ? double.infinity : 560,
              child: Text(
                "I'm open to full-time Flutter developer roles, freelance projects, and collaborations. Feel free to reach out!",
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 15,
                  color: AppColors.gray,
                  height: 1.8,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 20,
              runSpacing: 16,
              children: [
                _ContactItem(
                  icon: Icons.email_outlined,
                  label: 'EMAIL',
                  value: PortfolioData.email,
                ),
                _ContactItem(
                  icon: Icons.phone_outlined,
                  label: 'PHONE',
                  value: PortfolioData.phone,
                ),
                _ContactItem(
                  icon: Icons.link,
                  label: 'LINKEDIN',
                  value: 'muhammad-b-3521b82a0',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactItem extends StatefulWidget {
  final IconData icon;
  final String label, value;

  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  State<_ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<_ContactItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.cardBg : Colors.transparent,
          border: Border.all(
            color: _hovered ? AppColors.dimGray : AppColors.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, color: AppColors.gray, size: 18),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 10,
                    color: AppColors.gray,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  widget.value,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 13,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
