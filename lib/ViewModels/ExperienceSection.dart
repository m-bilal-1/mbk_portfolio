// ─── EXPERIENCE SECTION ───────────────────────────────────────────────────────
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/PortfolioData.dart';
import '../Utils/AppColors.dart';
import 'SectionWrapper.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      child: SectionWrapper(
        sectionNum: '02',
        title: 'Professional Experience',
        child: Column(
          children: PortfolioData.experience
              .map((e) => _ExperienceCard(data: e))
              .toList(),
        ),
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final Map<String, dynamic> data;
  const _ExperienceCard({required this.data});

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.cardBg : Colors.transparent,
          border: Border.all(
            color: _hovered ? AppColors.dimGray : AppColors.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isMobile) ...[
              _roleBadge(),
              const SizedBox(height: 4),
              _companyRow(),
            ] else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_roleBadge(), _companyRow()],
              ),
            const SizedBox(height: 20),
            ...widget.data['points'].map<Widget>(
                  (p) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7, right: 12),
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: AppColors.gray,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        p,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 13,
                          color: AppColors.gray,
                          height: 1.7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _roleBadge() => Text(
    widget.data['role'],
    style: GoogleFonts.spaceGrotesk(
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
  );

  Widget _companyRow() => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        widget.data['company'],
        style: GoogleFonts.spaceGrotesk(
          fontSize: 13,
          color: AppColors.gray,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(width: 12),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.dimGray),
        ),
        child: Text(
          widget.data['duration'],
          style: GoogleFonts.spaceGrotesk(
            fontSize: 10,
            color: AppColors.gray,
            letterSpacing: 1.2,
          ),
        ),
      ),
    ],
  );
}
