
// ─── PORTFOLIO DATA ───────────────────────────────────────────────────────────
import 'dart:ui';

class PortfolioData {
  static const name = 'Muhammad Bilal Khan';
  static const title = 'Flutter Developer';
  static const email = 'usbilal992@gmail.com';
  static const phone = '+923280150503';
  static const linkedin = 'https://www.linkedin.com/in/muhammad-b-3521b82a0/';
  static const intro =
      'Passionate Flutter developer skilled in building cross-platform mobile apps '
      'with a strong focus on UI/UX design, state management, and Firebase integration. '
      'Dedicated to delivering high-performance, user-friendly solutions.';

  static const List<Map<String, dynamic>> experience = [
    {
      'role': 'Flutter Developer Intern',
      'company': 'Arshi Soft House',
      'duration': '3-Month Internship',
      'points': [
        'Developed and optimized mobile apps using Flutter & Dart with focus on UI/UX',
        'Collaborated with team to deliver cross-platform apps meeting project requirements',
        'Enhanced app usability by contributing to intuitive designs and smooth performance',
        'Gained hands-on experience in mobile app lifecycle — design to deployment',
      ],
    },
    {
      'role': 'Flutter Developer Intern',
      'company': 'UET KICS Department',
      'duration': '1-Month Internship',
      'points': [
        'Built mobile apps using Flutter & Dart with focus on Provider and Cubit state management',
        'Contributed to the ShareKro app, enhancing functionality and reliability',
        'Implemented efficient solutions improving overall app efficiency and user experience',
        'Gained practical exposure to state management patterns and scalable app development',
      ],
    },
  ];
  static const List<Map<String, dynamic>> projects = [
    {
      'title': 'AI Smart Health Monitor',
      'tech': 'Flutter · MVVM · Google Flash',
      'icon': '🩺',
      'color': Color(0xFF1A1A2A),
      'accentColor': Color(0xFF9C27B0),
      'bgImage': 'assets/projects/AI Smart Health Monitor/1.png',
      'images': [
        'assets/projects/AI Smart Health Monitor/1.png',
        'assets/projects/AI Smart Health Monitor/2.png',
        'assets/projects/AI Smart Health Monitor/3.png',
        'assets/projects/AI Smart Health Monitor/4.png',
        'assets/projects/AI Smart Health Monitor/5.png',
        'assets/projects/AI Smart Health Monitor/6.png',
      ],
      'description': 'A cutting-edge, AI-driven health monitoring ecosystem that intelligently tracks vital signs and proactively predicts potential health risks.',
      'points': [
        'Architected with a robust MVVM design pattern to ensure seamless scalability and rigorous testability.',
        'Powered by Google Flash 2.5 Pro for lightning-fast, real-time health data processing and analytics.',
        'Seamlessly integrated the Google Fit API to accurately extract and monitor critical metrics like heart rate and SpO₂.',
        'Engineered a smart, priority-based notification engine to deliver instant alerts for critical health anomalies.',
        'Leveraged Firebase Cloud Firestore to guarantee highly secure, encrypted, and synchronized data storage.',
      ],
    },
    {
      'title': 'Ktfinancial Website',
      'tech': 'Flutter Web',
      'icon': '💼',
      'color': Color(0xFF1A2A3A),
      'accentColor': Color(0xFFFFB300),
      'bgImage': 'assets/projects/ktfinancial_bg.png',
      'images': [
        'assets/projects/ktfin_1.png',
        'assets/projects/ktfin_2.png',
        'assets/projects/ktfin_3.png',
      ],
      'description': 'A sleek, high-performance financial platform engineered for a premium client experience, leveraging modern web standards to deliver flawlessly smooth interactions.',
      'points': [
        'Crafted a highly responsive, visually captivating client-facing interface tailored for the financial sector.',
        'Applied sophisticated UI/UX principles to present complex financial data with absolute clarity and elegance.',
        'Ensured flawless cross-browser compatibility and adaptive navigation across all devices and screen sizes.',
        'Optimized core web vitals and performance metrics to guarantee lightning-fast load times and unwavering reliability.',
      ],
    },
    {
      'title': 'Car Management System',
      'tech': 'Flutter · Firebase · Link Widget',
      'icon': '🚗',
      'color': Color(0xFF1A2A1A),
      'accentColor': Color(0xFF4CAF50),
      'bgImage': 'Assets/projects/Car Management System/1.png',
      'images': [
        'Assets/projects/Car Management System/1.png',
        'Assets/projects/Car Management System/2.png',
        'Assets/projects/Car Management System/3.png',
        'Assets/projects/Car Management System/4.png',
        'Assets/projects/Car Management System/5.png',
        'Assets/projects/Car Management System/6.png',
        'Assets/projects/Car Management System/7.png',
        'Assets/projects/Car Management System/8.png',
        'Assets/projects/Car Management System/9.png',
        'Assets/projects/Car Management System/10.png',
        'Assets/projects/Car Management System/11.png',
        'Assets/projects/Car Management System/12.png',
        'Assets/projects/Car Management System/13.png',
        'Assets/projects/Car Management System/14.png',
        'Assets/projects/Car Management System/15.png',
        'Assets/projects/Car Management System/16.png',
        'Assets/projects/Car Management System/17.png',
        'Assets/projects/Car Management System/18.png',
      ],
      'description': 'An all-in-one, premium car management solution boasting a highly intuitive, modern interface that delivers a frictionless and visually stunning user journey.',
      'points': [
        'Engineered a dynamic, category-driven navigation system for users to seamlessly explore vehicles and their detailed specifications.',
        'Integrated a streamlined Contact Us module utilizing deep-link widgets for instantaneous, hassle-free communication.',
        'Implemented high-performance image retrieval and mapping techniques to showcase stunning vehicle galleries in real-time.',
        'Empowered users with advanced search, granular filtering, and personalized favorite lists for an optimized browsing experience.',
      ],
    },
    {
      'title': 'BMI Calculator & Tracker',
      'tech': 'Flutter · Dart',
      'icon': '⚖️',
      'color': Color(0xFF1A1A2A),
      'accentColor': Color(0xFF4A9EFF),
      'bgImage': 'Assets/projects/BMI Calculator & Tracker/1.png',
      'images': [
        'Assets/projects/BMI Calculator & Tracker/1.png',
        'Assets/projects/BMI Calculator & Tracker/2.png',
        'Assets/projects/BMI Calculator & Tracker/3.png',
        'Assets/projects/BMI Calculator & Tracker/4.png',
        'Assets/projects/BMI Calculator & Tracker/5.png',
        'Assets/projects/BMI Calculator & Tracker/6.png',
        'Assets/projects/BMI Calculator & Tracker/7.png',
        'Assets/projects/BMI Calculator & Tracker/8.png',
        'Assets/projects/BMI Calculator & Tracker/9.png',
        'Assets/projects/BMI Calculator & Tracker/10.png',
      ],
      'description': 'An elegantly crafted health utility application that precisely calculates, categorizes, and tracks Body Mass Index (BMI) using intuitive, color-coded visual feedback.',
      'points': [
        'Developed flexible unit conversion logic (cm/feet, kg/lbs) to ensure a globally accessible and user-friendly experience.',
        'Engineered precise algorithms to calculate and instantly categorize health metrics into visually distinct health brackets.',
        'Incorporated a comprehensive wellness guide offering actionable, tailored advice on diet, exercise, and lifestyle improvements.',
        'Designed a minimalist, highly responsive Flutter interface that transforms health data into a visually engaging dashboard.',
      ],
    },
    {
      'title': 'WhatsApp Clone UI',
      'tech': 'Flutter · UI',
      'icon': '💬',
      'color': Color(0xFF1A2A1A),
      'accentColor': Color(0xFF25D366),
      'bgImage': 'assets/projects/wa_bg.png',
      'images': [
        'assets/projects/wa_1.png',
        'assets/projects/wa_2.png',
        'assets/projects/wa_3.png',
      ],
      'description': 'A masterclass in pixel-perfect UI development, accurately replicating the globally recognized WhatsApp interface with high-fidelity, responsive layouts.',
      'points': [
        'Constructed a visually immersive chat interface that meticulously mirrors WhatsApp’s iconic design language.',
        'Architected seamless multi-screen navigation, flawlessly transitioning between chat lists, statuses, and call logs.',
        'Executed a precise implementation of brand-specific typography, color palettes, and iconography for absolute authenticity.',
        'Engineered highly customized, reusable Flutter widgets for dynamic chat bubbles, real-time timestamps, and status indicators.',
      ],
    },
    {
      'title': 'Advanced To-Do App',
      'tech': 'Flutter · Provider',
      'icon': '✅',
      'color': Color(0xFF2A1A1A),
      'accentColor': Color(0xFFFF6B6B),
      'bgImage': 'Assets/projects/Advanced To-Do App/1.png',
      'images': [
        'Assets/projects/Advanced To-Do App/1.png',
      ],
      'description': 'A powerhouse productivity application designed to supercharge daily workflows, featuring robust local storage and highly advanced task management capabilities.',
      'points': [
        'Integrated lightning-fast, persistent local storage via Shared Preferences to guarantee seamless data retention.',
        'Engineered flawless session management, ensuring user data is instantly available and synchronized across all app launches.',
        'Developed sophisticated, multi-tiered filtering logic to effortlessly sort and manage active, completed, and pending tasks.',
        'Empowered users with an intelligent priority management system to strategically organize and execute daily objectives.',
      ],
    },
  ];
  static final Map<String, dynamic> fyp = {
    'title': 'Final Year Project',
    'subtitle': 'AI-Powered Smart Health Monitoring & Prediction System',
    'tech': const ['Flutter', 'Dart', 'MVVM', 'Google Flash 2.5 Pro', 'Firebase', 'Provider', 'Google Fit API'],
    'description':
        'A modern AI-based cross-platform mobile application built with Flutter & MVVM architecture '
        'that intelligently monitors, analyzes, and predicts users health status through AI-driven '
        'insights — integrating real-time heart rate, SpO₂, temperature, and sleep data with '
        'personalized recommendations and intelligent alerts. Planned for Google Play Store deployment.',
    'features': const [
      {'icon': '🧠', 'title': 'AI Prediction Engine',     'desc': 'Google Flash 2.5 Pro predicts fatigue, dehydration & irregular heartbeat from health data'},
      {'icon': '📊', 'title': 'AI Smart Dashboard',       'desc': 'AI-generated charts, graphs, and trend summaries for daily health overview'},
      {'icon': '🔔', 'title': 'AI Health Alerts',         'desc': 'AI-prioritized push notifications when critical health values are detected'},
      {'icon': '🩺', 'title': 'Doctor Recommendation',    'desc': 'AI-based matching connects users with nearby doctors via telemedicine API'},
      {'icon': '🥗', 'title': 'AI Recommendation System', 'desc': 'Personalized fitness, diet, and wellness advice based on daily health patterns'},
      {'icon': '🔒', 'title': 'Secure Auth & Privacy',    'desc': 'Firebase auth with AI-driven risk detection for unusual login behavior'},
    ],
    'status': 'In Progress',
    'year': 'Expected 2026',
    'domain': 'Mobile App · AI · Cloud · MVVM',
  };
  static const Map<String, List<String>> skills = {
    'Languages': ['Dart', 'Python', 'C++'],
    'Frameworks': ['Flutter', 'Firebase', 'Provider', 'Cubit/Bloc'],
    'Tools': ['Git', 'GitHub', 'REST API', 'VS Code'],
    'Databases': ['Cloud Firestore', 'Shared Preferences', 'SQLite'],
    'Concepts': ['UI/UX Design', 'State Management', 'OOP', 'Problem Solving'],
  };
}
