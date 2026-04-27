// ─── HERO SECTION ─────────────────────────────────────────────────────────────
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/PortfolioData.dart';
import '../Utils/AppColors.dart';
import '../main.dart';
import 'ParticlePainter.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeCtrl;
  late AnimationController _particleCtrl;

  @override
  void initState() {
    super.initState();
    _fadeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();
    _particleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _fadeCtrl.dispose();
    _particleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 700;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // Animated particle background
          AnimatedBuilder(
            animation: _particleCtrl,
            builder: (_, __) => CustomPaint(
              painter: ParticlePainter(_particleCtrl.value),
              size: Size(w, MediaQuery.of(context).size.height),
            ),
          ),
          // Gradient overlay
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0.6, 0),
                radius: 1.2,
                colors: [Color(0x00080808), Color(0xFF080808)],
              ),
            ),
          ),
          // Content
          FadeTransition(
            opacity: _fadeCtrl,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 56,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 3),
                  // Tagline
                  Row(
                    children: [
                      Container(
                        width: 2,
                        height: 14,
                        color: AppColors.gray,
                        margin: const EdgeInsets.only(right: 12),
                      ),
                      Text(
                        '// CROSS-PLATFORM MOBILE SOLUTIONS',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 11,
                          color: AppColors.gray,
                          letterSpacing: 2.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Big title
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.3),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: _fadeCtrl,
                      curve: Curves.easeOutCubic,
                    )),
                    child: Text(
                      'FLUTTER',
                      style: GoogleFonts.bebasNeue(
                        fontSize: isMobile ? 80 : 140,
                        color: AppColors.white,
                        height: 0.9,
                        letterSpacing: isMobile ? 4 : 8,
                      ),
                    ),
                  ),
                  Text(
                    'DEVELOPER',
                    style: GoogleFonts.bebasNeue(
                      fontSize: isMobile ? 80 : 140,
                      color: AppColors.dimGray,
                      height: 0.9,
                      letterSpacing: isMobile ? 4 : 8,
                    ),
                  ),
                  const SizedBox(height: 28),
                  // Name & intro
                  Text(
                    PortfolioData.name,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: isMobile ? 15 : 18,
                      color: AppColors.accent,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: isMobile ? w - 48 : w * 0.42,
                    child: Text(
                      PortfolioData.intro,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 13.5,
                        color: AppColors.gray,
                        height: 1.8,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // CTA buttons
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      _HeroButton(
                        label: 'EXPLORE MY WORK',
                        filled: true,
                        onTap: () {},
                      ),
                      _HeroButton(
                        label: 'CONTACT ME',
                        filled: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const Spacer(flex: 2),
                  // Bottom stats
                  if (!isMobile)
                    Row(
                      children: [
                        _StatBadge(value: '2+', label: 'Internships'),
                        Container(
                          width: 1,
                          height: 32,
                          color: AppColors.border,
                          margin:
                          const EdgeInsets.symmetric(horizontal: 28),
                        ),
                        _StatBadge(value: '4+', label: 'Projects Built'),
                        Container(
                          width: 1,
                          height: 32,
                          color: AppColors.border,
                          margin:
                          const EdgeInsets.symmetric(horizontal: 28),
                        ),
                        _StatBadge(value: 'BS', label: 'CS – Exp. 2026'),
                      ],
                    ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class _HeroButton extends StatefulWidget {
  final String label;
  final bool filled;
  final VoidCallback onTap;

  const _HeroButton({
    required this.label,
    required this.filled,
    required this.onTap,
  });

  @override
  State<_HeroButton> createState() => _HeroButtonState();
}

class _HeroButtonState extends State<_HeroButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding:
          const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: widget.filled
                ? (_hovered ? AppColors.white.withOpacity(0.9) : AppColors.white)
                : Colors.transparent,
            border: Border.all(
              color: widget.filled
                  ? AppColors.white
                  : (_hovered ? AppColors.white : AppColors.gray),
            ),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: widget.filled
                  ? AppColors.bg
                  : (_hovered ? AppColors.white : AppColors.gray),
              letterSpacing: 2.5,
            ),
          ),
        ),
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final String value, label;
  const _StatBadge({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: GoogleFonts.bebasNeue(
            fontSize: 32,
            color: AppColors.white,
            letterSpacing: 2,
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

