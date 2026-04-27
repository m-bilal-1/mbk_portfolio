// ─── PROJECTS SECTION ─────────────────────────────────────────────────────────
// FILES NEEDED:
//   • projects_section.dart      ← main grid (this file)
//   • project_detail_page.dart   ← full detail page
//
// In PortfolioData.projects, add 'images' list to each project:
//
//  {
//    'title': 'Car Management App',
//    'tech': 'Flutter · Firebase',
//    'icon': '🚗',
//    'color': Color(0xFF1A2A1A),
//    'accentColor': Color(0xFF4CAF50),
//    'bgImage': 'assets/projects/car_bg.png',   // ← main bg photo
//    'images': [                                 // ← carousel photos
//      'assets/projects/car_1.png',
//      'assets/projects/car_2.png',
//      'assets/projects/car_3.png',
//    ],
//    'description': 'A full-featured car management...',  // ← long description
//    'points': [...],
//  },
//
// ──────────────────────────────────────────────────────────────────────────────

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors, Navigator, MaterialPageRoute, Theme, Scaffold, SingleChildScrollView, SafeArea, IconButton, Icons, PageController, GestureDetector, Material, InkWell;
import 'package:google_fonts/google_fonts.dart';

import '../Models/PortfolioData.dart';
import '../Utils/AppColors.dart';
import 'ProjectDetailPage.dart';
import 'SectionWrapper.dart';

// ══════════════════════════════════════════════════════════════════════════════
//  PROJECTS GRID — projects_section.dart
// ══════════════════════════════════════════════════════════════════════════════

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 700;
    final crossAxis = isMobile ? 1 : 2;

    return SectionWrapper(
      sectionNum: '03',
      title: 'Projects',
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxis,
          childAspectRatio: isMobile ? 1.1 : 1.0,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: PortfolioData.projects.length,
        itemBuilder: (_, i) => _ProjectCard(data: PortfolioData.projects[i]),
      ),
    );
  }
}

// ── Project Card (Grid Tile) ───────────────────────────────────────────────────

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> data;
  const _ProjectCard({required this.data});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final accent  = widget.data['accentColor'] as Color;
    final bgImage = widget.data['bgImage'] as String?;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          // ── Navigate to detail page ──────────────────────────────────────
          onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => ProjectDetailPage(data: widget.data),
            ),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 280),
            decoration: BoxDecoration(
              color: _hovered
                  ? (widget.data['color'] as Color)
                  : AppColors.cardBg,
              border: Border.all(
                color: _hovered ? accent.withOpacity(0.5) : AppColors.border,
              ),
            ),
            child: Stack(
              children: [
                // ── Background photo (dimmed) ──────────────────────────────
                if (bgImage != null)
                  Positioned.fill(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 280),
                      opacity: _hovered ? 0.12 : 0.0,
                      child: Image.asset(
                        bgImage,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const SizedBox(),
                      ),
                    ),
                  ),

                // ── Card content ───────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon + tech badge
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.data['icon'],
                              style: const TextStyle(fontSize: 32)),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(color: accent.withOpacity(0.4)),
                            ),
                            child: Text(
                              widget.data['tech'],
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 10,
                                color: accent,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.data['title'],
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: (widget.data['points'] as List)
                              .take(4)
                              .map<Widget>((p) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 6, right: 10),
                                  child: Container(
                                    width: 3,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: accent,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    p,
                                    style: GoogleFonts.spaceGrotesk(
                                      fontSize: 12,
                                      color: AppColors.gray,
                                      height: 1.6,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ))
                              .toList(),
                        ),
                      ),
                      // ── "View Details" hint ──────────────────────────────
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),
                        opacity: _hovered ? 1.0 : 0.0,
                        child: Row(
                          children: [
                            Text(
                              'VIEW DETAILS',
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 10,
                                color: accent,
                                letterSpacing: 2.5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Icon(Icons.arrow_forward,
                                color: accent, size: 12),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
