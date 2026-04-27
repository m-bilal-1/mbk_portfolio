
// ─── HOME SCAFFOLD ────────────────────────────────────────────────────────────
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/AppColors.dart';
import '../main.dart';
import 'ContactSection.dart';
import 'ContactSectionform.dart';
import 'ExperienceSection.dart';
import 'FooterWidget.dart';
import 'FypSection.dart';
import 'HeroSection.dart';
import 'NavBar.dart';
import 'ProjectsSection.dart';
import 'SkillsSection.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}
class _PortfolioHomeState extends State<PortfolioHome> {
  final _scrollController = ScrollController();
  final _sectionKeys = {
    'home': GlobalKey(),
    'experience': GlobalKey(),
    'projects': GlobalKey(),
    'fyp': GlobalKey(),
    'skills': GlobalKey(),
    'contact': GlobalKey(),
    'contactform': GlobalKey(),
  };
  String _activeSection = 'home';
  bool _navSolid = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    setState(() => _navSolid = offset > 60);
  }

  void _scrollTo(String section) {
    final key = _sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
      setState(() => _activeSection = section);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(key: _sectionKeys['home']),
                ExperienceSection(key: _sectionKeys['experience']),
                ProjectsSection(key: _sectionKeys['projects']),
                FypSection(key: _sectionKeys['fyp']),
                SkillsSection(key: _sectionKeys['skills']),
                ContactSectionForm(key: _sectionKeys['contactform']),
                ContactSection(key: _sectionKeys['contact']),
                const FooterWidget(),
              ],
            ),
          ),
          // Floating nav
          NavBar(
            solid: _navSolid,
            active: _activeSection,
            onTap: _scrollTo,
          ),
        ],
      ),
    );
  }
}

