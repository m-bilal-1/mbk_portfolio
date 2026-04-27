// ─── FYP SECTION ─────────────────────────────────────────────────────────────
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:google_fonts/google_fonts.dart';

import '../Models/PortfolioData.dart';
import '../Utils/AppColors.dart';
import 'SectionWrapper.dart';

// ──────────────────────────────────────────────────────────────────────────────
// PASTE THIS INTO PortfolioData.dart  →  replace the old `fyp` map
// ──────────────────────────────────────────────────────────────────────────────
//
//
//
// ──────────────────────────────────────────────────────────────────────────────

class FypSection extends StatelessWidget {
  const FypSection({super.key});

  @override
  Widget build(BuildContext context) {
    final fyp = PortfolioData.fyp;
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      color: AppColors.surface,
      child: SectionWrapper(
        sectionNum: '04',
        title: 'Final Year Project',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero card ──────────────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(36),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0A0A1A), Color(0xFF0A1A0A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                    color: AppColors.accentGlow.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status + domain row
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: [
                      _StatusDot(
                          label: '${fyp['status']} · ${fyp['year']}'),
                      _InlineBadge(
                          label: fyp['domain'],
                          color: AppColors.accentGlow),
                    ],
                  ),
                  const SizedBox(height: 18),
                  // Title
                  Text(
                    fyp['subtitle'],
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: isMobile ? 19 : 26,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Description
                  Text(
                    fyp['description'],
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 13.5,
                      color: AppColors.gray,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 22),
                  // Tech stack chips
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: (fyp['tech'] as List<String>)
                        .map((t) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color:
                        AppColors.accentGlow.withOpacity(0.1),
                        border: Border.all(
                          color: AppColors.accentGlow
                              .withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        t,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 11,
                          color: AppColors.accentGlow,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ))
                        .toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ── Key Features label ─────────────────────────────────────────
            Text(
              'KEY FEATURES',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 11,
                color: AppColors.gray,
                letterSpacing: 3,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),

            // ── Features grid ──────────────────────────────────────────────
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 3,
                childAspectRatio: isMobile ? 3.5 : 2.2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: (fyp['features'] as List).length,
              itemBuilder: (_, i) {
                final feat = (fyp['features'] as List)[i];
                return _FypFeatureCard(
                  icon: feat['icon'],
                  title: feat['title'],
                  desc: feat['desc'],
                );
              },
            ),

            const SizedBox(height: 32),

            // ── Future Scope strip ─────────────────────────────────────────
            Text(
              'FUTURE SCOPE',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 11,
                color: AppColors.gray,
                letterSpacing: 3,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const [
                _FutureBadge(icon: '🏪', label: 'Play Store Release'),
                _FutureBadge(icon: '🤖', label: 'Vertex AI / TFLite'),
                _FutureBadge(icon: '⌚', label: 'IoT Wearable Support'),
                _FutureBadge(icon: '🍎', label: 'iOS + Web Dashboard'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Small widgets ──────────────────────────────────────────────────────────────

class _StatusDot extends StatelessWidget {
  final String label;
  const _StatusDot({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.only(right: 8),
          decoration: const BoxDecoration(
            color: Color(0xFF4CAF50),
            shape: BoxShape.circle,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 11,
            color: AppColors.gray,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}

class _InlineBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _InlineBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(0.35)),
      ),
      child: Text(
        label,
        style: GoogleFonts.spaceGrotesk(
          fontSize: 10,
          color: color,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _FypFeatureCard extends StatefulWidget {
  final String icon, title, desc;
  const _FypFeatureCard(
      {required this.icon, required this.title, required this.desc});

  @override
  State<_FypFeatureCard> createState() => _FypFeatureCardState();
}

class _FypFeatureCardState extends State<_FypFeatureCard> {
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
          color: _hovered
              ? AppColors.accentGlow.withOpacity(0.05)
              : Colors.transparent,
          border: Border.all(
            color: _hovered
                ? AppColors.accentGlow.withOpacity(0.3)
                : AppColors.border,
          ),
        ),
        child: Row(
          children: [
            Text(widget.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.desc,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 11,
                      color: AppColors.gray,
                      height: 1.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FutureBadge extends StatelessWidget {
  final String icon, label;
  const _FutureBadge({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 12,
              color: AppColors.gray,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}