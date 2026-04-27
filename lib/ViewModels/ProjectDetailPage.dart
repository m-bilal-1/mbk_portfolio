

// ══════════════════════════════════════════════════════════════════════════════
//  PROJECT DETAIL PAGE — project_detail_page.dart
// ══════════════════════════════════════════════════════════════════════════════

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/AppColors.dart';

class ProjectDetailPage extends StatefulWidget {
  final Map<String, dynamic> data;
  const ProjectDetailPage({super.key, required this.data});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w       = MediaQuery.of(context).size.width;
    final isMobile = w < 700;
    final accent  = widget.data['accentColor'] as Color;
    final bgImage = widget.data['bgImage'] as String?;
    final images  = (widget.data['images'] as List<String>?) ?? [];
    final desc    = widget.data['description'] as String? ??
        widget.data['points'].join('\n\n');

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero banner with background photo ─────────────────────────
            _HeroBanner(
              title:   widget.data['title'],
              tech:    widget.data['tech'],
              icon:    widget.data['icon'],
              accent:  accent,
              bgImage: bgImage,
              isMobile: isMobile,
              onBack:  () => Navigator.pop(context),
            ),

            // ── Body ──────────────────────────────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80,
                vertical:   48,
              ),
              child: isMobile
                  ? _MobileLayout(
                data:           widget.data,
                accent:         accent,
                images:         images,
                desc:           desc,
                pageController: _pageController,
                currentPage:    _currentPage,
                onPageChanged:  (i) =>
                    setState(() => _currentPage = i),
              )
                  : _DesktopLayout(
                data:           widget.data,
                accent:         accent,
                images:         images,
                desc:           desc,
                pageController: _pageController,
                currentPage:    _currentPage,
                onPageChanged:  (i) =>
                    setState(() => _currentPage = i),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Hero Banner ───────────────────────────────────────────────────────────────

class _HeroBanner extends StatelessWidget {
  final String title, tech, icon;
  final Color accent;
  final String? bgImage;
  final bool isMobile;
  final VoidCallback onBack;

  const _HeroBanner({
    required this.title,
    required this.tech,
    required this.icon,
    required this.accent,
    required this.bgImage,
    required this.isMobile,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isMobile ? 260 : 380,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          if (bgImage != null)
            Image.asset(
              bgImage!,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: AppColors.surface),
            )
          else
            Container(color: AppColors.surface),

          // Dark overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end:   Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  AppColors.bg,
                ],
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24 : 80, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  GestureDetector(
                    onTap: onBack,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.arrow_back_ios,
                            color: AppColors.gray, size: 14),
                        const SizedBox(width: 6),
                        Text(
                          'BACK TO PROJECTS',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 11,
                            color: AppColors.gray,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Tech badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color:   accent.withOpacity(0.15),
                      border:  Border.all(color: accent.withOpacity(0.4)),
                    ),
                    child: Text(
                      tech,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 11,
                        color:         accent,
                        letterSpacing: 1.5,
                        fontWeight:    FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '$icon  $title',
                    style: GoogleFonts.bebasNeue(
                      fontSize:      isMobile ? 40 : 64,
                      color:         AppColors.white,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Desktop Layout (side by side) ─────────────────────────────────────────────

class _DesktopLayout extends StatelessWidget {
  final Map<String, dynamic> data;
  final Color accent;
  final List<String> images;
  final String desc;
  final PageController pageController;
  final int currentPage;
  final ValueChanged<int> onPageChanged;

  const _DesktopLayout({
    required this.data,
    required this.accent,
    required this.images,
    required this.desc,
    required this.pageController,
    required this.currentPage,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left — info
        Expanded(
          flex: 5,
          child: _InfoPanel(
              data: data, accent: accent, desc: desc),
        ),
        const SizedBox(width: 56),
        // Right — laptop frame carousel
        Expanded(
          flex: 5,
          child: _LaptopCarousel(
            images:         images,
            accent:         accent,
            pageController: pageController,
            currentPage:    currentPage,
            onPageChanged:  onPageChanged,
          ),
        ),
      ],
    );
  }
}

// ── Mobile Layout (stacked) ───────────────────────────────────────────────────

class _MobileLayout extends StatelessWidget {
  final Map<String, dynamic> data;
  final Color accent;
  final List<String> images;
  final String desc;
  final PageController pageController;
  final int currentPage;
  final ValueChanged<int> onPageChanged;

  const _MobileLayout({
    required this.data,
    required this.accent,
    required this.images,
    required this.desc,
    required this.pageController,
    required this.currentPage,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LaptopCarousel(
          images:         images,
          accent:         accent,
          pageController: pageController,
          currentPage:    currentPage,
          onPageChanged:  onPageChanged,
        ),
        const SizedBox(height: 40),
        _InfoPanel(data: data, accent: accent, desc: desc),
      ],
    );
  }
}


// ── Info Panel ────────────────────────────────────────────────────────────────

class _InfoPanel extends StatelessWidget {
  final Map<String, dynamic> data;
  final Color accent;
  final String desc;

  const _InfoPanel({
    required this.data,
    required this.accent,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Description
        Text(
          'ABOUT THIS PROJECT',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 11,
            color:         AppColors.gray,
            letterSpacing: 3,
            fontWeight:    FontWeight.w600,
          ),
        ),
        Container(
          width: 32,
          height: 2,
          margin: const EdgeInsets.symmetric(vertical: 12),
          color: accent,
        ),
        Text(
          desc,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 14,
            color:  AppColors.gray,
            height: 1.9,
          ),
        ),
        const SizedBox(height: 36),

        // Feature list
        Text(
          'KEY FEATURES',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 11,
            color:         AppColors.gray,
            letterSpacing: 3,
            fontWeight:    FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        ...(data['points'] as List).map<Widget>(
              (p) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7, right: 14),
                  child: Container(
                    width:  6,
                    height: 6,
                    decoration: BoxDecoration(
                        color: accent, shape: BoxShape.circle),
                  ),
                ),
                Expanded(
                  child: Text(
                    p,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 13,
                      color:  AppColors.accent,
                      height: 1.7,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Laptop Frame Carousel ─────────────────────────────────────────────────────

class _LaptopCarousel extends StatelessWidget {
  final List<String> images;
  final Color accent;
  final PageController pageController;
  final int currentPage;
  final ValueChanged<int> onPageChanged;

  const _LaptopCarousel({
    required this.images,
    required this.accent,
    required this.pageController,
    required this.currentPage,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return _LaptopFrame(
        accent: accent,
        child: Container(
          color: AppColors.surface,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('🖼️', style: TextStyle(fontSize: 40)),
                const SizedBox(height: 12),
                Text(
                  'Screenshots Coming Soon',
                  style: GoogleFonts.spaceGrotesk(
                      fontSize: 13, color: AppColors.gray),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        // ── Laptop frame with PageView inside ─────────────────────────────
        _LaptopFrame(
          accent: accent,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: onPageChanged,
            itemCount: images.length,
            itemBuilder: (_, i) => Image.asset(
              images[i],
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: AppColors.surface,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('🖼️',
                          style: const TextStyle(fontSize: 36)),
                      const SizedBox(height: 8),
                      Text(
                        'Photo ${i + 1}',
                        style: GoogleFonts.spaceGrotesk(
                            fontSize: 12, color: AppColors.gray),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

        // ── Dot indicators + arrows ────────────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Left arrow
            GestureDetector(
              onTap: () => pageController.previousPage(
                duration: const Duration(milliseconds: 350),
                curve:    Curves.easeInOut,
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border),
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.gray,
                  size: 12,
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Dots
            Row(
              children: List.generate(
                images.length,
                    (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width:  currentPage == i ? 20 : 6,
                  height: 6,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color:  currentPage == i ? accent : AppColors.dimGray,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),
            // Right arrow
            GestureDetector(
              onTap: () => pageController.nextPage(
                duration: const Duration(milliseconds: 350),
                curve:    Curves.easeInOut,
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.gray,
                  size: 12,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),
        Text(
          '${currentPage + 1} / ${images.length}',
          style: GoogleFonts.spaceGrotesk(
              fontSize: 11, color: AppColors.gray, letterSpacing: 1.5),
        ),
      ],
    );
  }
}

// ── Laptop Frame Widget ────────────────────────────────────────────────────────

class _LaptopFrame extends StatelessWidget {
  final Widget child;
  final Color accent;
  const _LaptopFrame({required this.child, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Screen ────────────────────────────────────────────────────────
        Container(
          decoration: BoxDecoration(
            color:        const Color(0xFF1C1C1E),
            borderRadius: const BorderRadius.only(
              topLeft:     Radius.circular(12),
              topRight:    Radius.circular(12),
            ),
            border: Border.all(color: const Color(0xFF3A3A3C), width: 2.5),
            boxShadow: [
              BoxShadow(
                color:      accent.withOpacity(0.12),
                blurRadius: 40,
                spreadRadius: 4,
              ),
            ],
          ),
          child: Column(
            children: [
              // Top bar (camera dot + fake traffic lights)
              Container(
                height: 28,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: const BoxDecoration(
                  color: Color(0xFF2C2C2E),
                  borderRadius: BorderRadius.only(
                    topLeft:  Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    // Traffic lights
                    _trafficDot(const Color(0xFFFF5F57)),
                    const SizedBox(width: 6),
                    _trafficDot(const Color(0xFFFFBD2E)),
                    const SizedBox(width: 6),
                    _trafficDot(const Color(0xFF28C840)),
                    const Spacer(),
                    // Camera dot
                    Container(
                      width: 6, height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF3A3A3C),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
              // Screen content
              AspectRatio(
                aspectRatio: 16 / 10,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft:  Radius.circular(2),
                    bottomRight: Radius.circular(2),
                  ),
                  child: child,
                ),
              ),
            ],
          ),
        ),

        // ── Hinge ─────────────────────────────────────────────────────────
        Container(
          height: 6,
          decoration: const BoxDecoration(
            color: Color(0xFF2C2C2E),
            borderRadius: BorderRadius.only(
              bottomLeft:  Radius.circular(2),
              bottomRight: Radius.circular(2),
            ),
          ),
        ),

        // ── Base ──────────────────────────────────────────────────────────
        Container(
          height: 18,
          decoration: const BoxDecoration(
            color: Color(0xFF1C1C1E),
            borderRadius: BorderRadius.only(
              bottomLeft:  Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Center(
            child: Container(
              width: 60, height: 4,
              decoration: BoxDecoration(
                color:        const Color(0xFF3A3A3C),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),

        // ── Stand ─────────────────────────────────────────────────────────
        Container(
          width: double.infinity,
          height: 4,
          decoration: const BoxDecoration(
            color: Color(0xFF2C2C2E),
            borderRadius: BorderRadius.only(
              bottomLeft:  Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
          ),
        ),
      ],
    );
  }

  Widget _trafficDot(Color color) => Container(
    width: 10, height: 10,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}