
// ─── NAVIGATION BAR ───────────────────────────────────────────────────────────
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/AppColors.dart';

class NavBar extends StatelessWidget {
  final bool solid;
  final String active;
  final void Function(String) onTap;

  const NavBar({
    super.key,
    required this.solid,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 700;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: solid ? AppColors.bg.withOpacity(0.95) : Colors.transparent,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 48,
            vertical: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              GestureDetector(
                onTap: () => onTap('home'),
                child: Text(
                  'MBK.DEV',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    letterSpacing: 3,
                  ),
                ),
              ),
              if (!isMobile)
                Row(
                  children: [
                    for (final item in [
                      ['home', '01/ HOME'],
                      ['experience', '02/ EXPERIENCE'],
                      ['projects', '03/ PROJECTS'],
                      ['fyp', '04/ FYP'],
                      ['skills', '05/ SKILLS'],
                      ['contact', '06/ CONTACT'],
                    ])
                      _NavItem(
                        label: item[1],
                        isActive: active == item[0],
                        onTap: () => onTap(item[0]),
                      ),
                  ],
                ),
              if (isMobile)
                _MobileMenu(onTap: onTap),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
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
          margin: const EdgeInsets.only(left: 28),
          child: Text(
            widget.label,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: (widget.isActive || _hovered)
                  ? AppColors.white
                  : AppColors.gray,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileMenu extends StatefulWidget {
  final void Function(String) onTap;
  const _MobileMenu({required this.onTap});

  @override
  State<_MobileMenu> createState() => _MobileMenuState();
}

class _MobileMenuState extends State<_MobileMenu> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => setState(() => _open = !_open),
          child: Icon(
            _open ? Icons.close : Icons.menu,
            color: AppColors.white,
            size: 22,
          ),
        ),
        if (_open) ...[
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                for (final item in [
                  ['home', 'HOME'],
                  ['experience', 'EXPERIENCE'],
                  ['projects', 'PROJECTS'],
                  ['fyp', 'FYP'],
                  ['skills', 'SKILLS'],
                  ['contact', 'CONTACT'],
                ])
                  GestureDetector(
                    onTap: () {
                      setState(() => _open = false);
                      widget.onTap(item[0]);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      child: Text(
                        item[1],
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 12,
                          color: AppColors.accent,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
