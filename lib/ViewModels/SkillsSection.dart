
// ─── SKILLS SECTION ───────────────────────────────────────────────────────────
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/PortfolioData.dart';
import '../Utils/AppColors.dart';
import 'SectionWrapper.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return SectionWrapper(
      sectionNum: '05',
      title: 'Skills',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: PortfolioData.skills.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 28),
            child: isMobile
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _skillLabel(entry.key),
                const SizedBox(height: 12),
                _skillChips(entry.value),
              ],
            )
                : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 160, child: _skillLabel(entry.key)),
                Expanded(child: _skillChips(entry.value)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _skillLabel(String label) => Text(
    label.toUpperCase(),
    style: GoogleFonts.spaceGrotesk(
      fontSize: 11,
      color: AppColors.gray,
      letterSpacing: 2,
      fontWeight: FontWeight.w600,
    ),
  );

  Widget _skillChips(List<String> skills) => Wrap(
    spacing: 10,
    runSpacing: 10,
    children: skills.map((s) => _SkillChip(label: s)).toList(),
  );
}

class _SkillChip extends StatefulWidget {
  final String label;
  const _SkillChip({required this.label});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.white : Colors.transparent,
          border: Border.all(
            color: _hovered ? AppColors.white : AppColors.dimGray,
          ),
        ),
        child: Text(
          widget.label,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 12,
            color: _hovered ? AppColors.bg : AppColors.accent,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}

