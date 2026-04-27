
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show CircularProgressIndicator, Colors, Icons, SnackBar, SnackBarBehavior, ScaffoldMessenger, Theme, OutlineInputBorder, InputDecoration, TextFormField;
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../Utils/AppColors.dart';
import 'SectionWrapper.dart';

// ── EmailJS credentials ────────────────────────────────────────────────────────
const _serviceId  = 'service_vkfoua2';
const _templateId = 'IK9n7_YFvxiysDH01';   // ✅ set
const _publicKey  = 'YOUR_PUBLIC_KEY';    // ← replace
const _toEmail    = 'usbilal992@gmail.com';

// ══════════════════════════════════════════════════════════════════════════════

class ContactSectionForm extends StatelessWidget {
  const ContactSectionForm({super.key});

  @override
  Widget build(BuildContext context) {
    final w        = MediaQuery.of(context).size.width;
    final isMobile = w < 700;

    return Container(
      color: AppColors.surface,
      child: SectionWrapper(
        sectionNum: '06',
        title: "Let's Connect Via Mail",
        child: isMobile
            ? const _ContactForm()
            : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Left: info panel ──────────────────────────────────
            Expanded(
              flex: 4,
              child: _InfoPanel(),
            ),
            const SizedBox(width: 60),
            // ── Right: form ───────────────────────────────────────
            const Expanded(
              flex: 6,
              child: _ContactForm(),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Left Info Panel ───────────────────────────────────────────────────────────

class _InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatar + name card (like the screenshot)
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color:  AppColors.cardBg,
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Container(
                width:  48,
                height: 48,
                decoration: BoxDecoration(
                  color:        const Color(0xFF4A4AFF).withOpacity(0.2),
                  shape:        BoxShape.circle,
                  border:       Border.all(
                      color: const Color(0xFF4A4AFF), width: 2),
                ),
                child: const Center(
                  child: Text('MBK',
                      style: TextStyle(
                          fontSize:   13,
                          color:      Colors.white,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Muhammad Bilal Khan',
                      style: GoogleFonts.spaceGrotesk(
                          fontSize:   14,
                          fontWeight: FontWeight.w700,
                          color:      AppColors.white)),
                  const SizedBox(height: 3),
                  Text('Flutter Developer',
                      style: GoogleFonts.spaceGrotesk(
                          fontSize: 12, color: AppColors.gray)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),

        Text(
          "I'm open to full-time Flutter developer roles, "
              "freelance projects, and collaborations. "
              "Fill out the form and I'll get back to you shortly!",
          style: GoogleFonts.spaceGrotesk(
              fontSize: 13.5, color: AppColors.gray, height: 1.85),
        ),
        const SizedBox(height: 32),

        // Contact items
        _contactRow(Icons.email_outlined,    'EMAIL',    _toEmail),
        const SizedBox(height: 16),
        _contactRow(Icons.phone_outlined,    'PHONE',    '+92 328 0150503'),
        const SizedBox(height: 16),
        _contactRow(Icons.link,              'LINKEDIN', 'muhammad-b-3521b82a0'),
      ],
    );
  }

  Widget _contactRow(IconData icon, String label, String value) =>
      Row(
        children: [
          Icon(icon, color: AppColors.gray, size: 16),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: GoogleFonts.spaceGrotesk(
                      fontSize: 10,
                      color:    AppColors.gray,
                      letterSpacing: 1.8)),
              const SizedBox(height: 2),
              Text(value,
                  style: GoogleFonts.spaceGrotesk(
                      fontSize:   12,
                      color:      AppColors.accent,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      );
}

// ── Contact Form ──────────────────────────────────────────────────────────────

class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey    = GlobalKey<FormState>();
  final _nameCtrl    = TextEditingController();
  final _emailCtrl   = TextEditingController();
  final _phoneCtrl   = TextEditingController();
  final _subjectCtrl = TextEditingController();
  final _msgCtrl     = TextEditingController();
  bool  _agreed      = false;
  bool  _loading     = false;
  bool  _sent        = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _subjectCtrl.dispose();
    _msgCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_agreed) {
      _showSnack('Please agree to the privacy policy.', error: true);
      return;
    }

    setState(() => _loading = true);

    try {
      final response = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'service_id':  _serviceId,
          'template_id': _templateId,
          'user_id':     _publicKey,
          'template_params': {
            'from_name':  _nameCtrl.text.trim(),
            'from_email': _emailCtrl.text.trim(),
            'phone':      _phoneCtrl.text.trim(),
            'subject':    _subjectCtrl.text.trim(),
            'message':    _msgCtrl.text.trim(),
            'to_email':   _toEmail,
          },
        }),
      );

      if (response.statusCode == 200) {
        setState(() => _sent = true);
        _nameCtrl.clear();
        _emailCtrl.clear();
        _phoneCtrl.clear();
        _subjectCtrl.clear();
        _msgCtrl.clear();
        setState(() => _agreed = false);
      } else {
        _showSnack('Failed to send. Please try again.', error: true);
      }
    } catch (e) {
      _showSnack('Network error. Check your connection.', error: true);
    } finally {
      setState(() => _loading = false);
    }
  }

  void _showSnack(String msg, {bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg,
            style: GoogleFonts.spaceGrotesk(color: Colors.white)),
        backgroundColor:
        error ? const Color(0xFFE53935) : const Color(0xFF43A047),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ── Success state ──────────────────────────────────────────────────────
    if (_sent) {
      return Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color:  AppColors.cardBg,
          border: Border.all(color: const Color(0xFF43A047).withOpacity(0.4)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('✅', style: TextStyle(fontSize: 48)),
            const SizedBox(height: 20),
            Text('Message Sent!',
                style: GoogleFonts.bebasNeue(
                    fontSize: 32, color: AppColors.white, letterSpacing: 2)),
            const SizedBox(height: 12),
            Text("Thanks for reaching out. I'll reply to $_toEmail shortly.",
                textAlign: TextAlign.center,
                style: GoogleFonts.spaceGrotesk(
                    fontSize: 13, color: AppColors.gray, height: 1.7)),
            const SizedBox(height: 28),
            _OutlineButton(
              label: 'SEND ANOTHER',
              onTap:  () => setState(() => _sent = false),
            ),
          ],
        ),
      );
    }

    // ── Form ──────────────────────────────────────────────────────────────
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color:  AppColors.cardBg,
        border: Border.all(color: AppColors.border),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header (like screenshot)
            Text('Send Me a Message',
                style: GoogleFonts.spaceGrotesk(
                    fontSize:   22,
                    fontWeight: FontWeight.w700,
                    color:      AppColors.white)),
            const SizedBox(height: 6),
            Text(
              "Let me know what you're working on and I'll get back to you.",
              style: GoogleFonts.spaceGrotesk(
                  fontSize: 12.5, color: AppColors.gray, height: 1.6),
            ),
            const SizedBox(height: 28),

            // Fields
            _Field(
              label:       'FULL NAME',
              hint:        'Your full name',
              controller:  _nameCtrl,
              validator:   (v) =>
              (v == null || v.trim().isEmpty) ? 'Name is required' : null,
            ),
            const SizedBox(height: 18),
            _Field(
              label:      'EMAIL',
              hint:       'Your email address',
              controller: _emailCtrl,
              keyboard:   TextInputType.emailAddress,
              validator:  (v) {
                if (v == null || v.trim().isEmpty) return 'Email is required';
                if (!v.contains('@')) return 'Enter a valid email';
                return null;
              },
            ),
            const SizedBox(height: 18),
            _Field(
              label:      'PHONE',
              hint:       'Your phone number',
              controller: _phoneCtrl,
              keyboard:   TextInputType.phone,
              validator:  (v) =>
              (v == null || v.trim().isEmpty) ? 'Phone is required' : null,
            ),
            const SizedBox(height: 18),
            _Field(
              label:      'SUBJECT',
              hint:       'Subject',
              controller: _subjectCtrl,
              validator:  (v) =>
              (v == null || v.trim().isEmpty) ? 'Subject is required' : null,
            ),
            const SizedBox(height: 18),
            _Field(
              label:      'MESSAGE',
              hint:       'Your message',
              controller: _msgCtrl,
              maxLines:   5,
              validator:  (v) =>
              (v == null || v.trim().isEmpty) ? 'Message is required' : null,
            ),
            const SizedBox(height: 20),

            // Privacy checkbox
            GestureDetector(
              onTap: () => setState(() => _agreed = !_agreed),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    width:  18,
                    height: 18,
                    margin: const EdgeInsets.only(top: 1, right: 12),
                    decoration: BoxDecoration(
                      color:  _agreed
                          ? const Color(0xFF4A4AFF)
                          : Colors.transparent,
                      border: Border.all(
                        color: _agreed
                            ? const Color(0xFF4A4AFF)
                            : AppColors.dimGray,
                      ),
                    ),
                    child: _agreed
                        ? const Icon(Icons.check,
                        size: 12, color: Colors.white)
                        : null,
                  ),
                  Expanded(
                    child: Text(
                      'I agree that my personal data will be processed in '
                          'accordance with the privacy policy.',
                      style: GoogleFonts.spaceGrotesk(
                          fontSize: 11,
                          color:    AppColors.gray,
                          height:   1.6),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: _loading
                  ? const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.white, strokeWidth: 2))
                  : _FilledButton(
                label: 'SEND MESSAGE',
                onTap:  _submit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Reusable field ─────────────────────────────────────────────────────────────

class _Field extends StatefulWidget {
  final String label, hint;
  final TextEditingController controller;
  final TextInputType keyboard;
  final int maxLines;
  final String? Function(String?) validator;

  const _Field({
    required this.label,
    required this.hint,
    required this.controller,
    required this.validator,
    this.keyboard = TextInputType.text,
    this.maxLines  = 1,
  });

  @override
  State<_Field> createState() => _FieldState();
}

class _FieldState extends State<_Field> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.label} *',
          style: GoogleFonts.spaceGrotesk(
              fontSize:      10,
              color:         AppColors.gray,
              letterSpacing: 2,
              fontWeight:    FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Focus(
          onFocusChange: (f) => setState(() => _focused = f),
          child: TextFormField(
            controller:  widget.controller,
            keyboardType: widget.keyboard,
            maxLines:    widget.maxLines,
            validator:   widget.validator,
            style: GoogleFonts.spaceGrotesk(
                fontSize: 13, color: AppColors.white),
            decoration: InputDecoration(
              hintText:       widget.hint,
              hintStyle:      GoogleFonts.spaceGrotesk(
                  fontSize: 13, color: AppColors.dimGray),
              filled:         true,
              fillColor:      AppColors.surface,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide:   BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide:   BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide:   BorderSide(
                    color: AppColors.white, width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide:   BorderSide(
                    color: const Color(0xFFE53935)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide:   BorderSide(
                    color: const Color(0xFFE53935), width: 1.5),
              ),
              errorStyle: GoogleFonts.spaceGrotesk(
                  fontSize: 10, color: const Color(0xFFE53935)),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Buttons ───────────────────────────────────────────────────────────────────

class _FilledButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _FilledButton({required this.label, required this.onTap});

  @override
  State<_FilledButton> createState() => _FilledButtonState();
}

class _FilledButtonState extends State<_FilledButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 16),
          color: _hovered
              ? AppColors.white.withOpacity(0.9)
              : AppColors.white,
          child: Center(
            child: Text(
              widget.label,
              style: GoogleFonts.spaceGrotesk(
                  fontSize:      11,
                  fontWeight:    FontWeight.w700,
                  color:         AppColors.bg,
                  letterSpacing: 2.5),
            ),
          ),
        ),
      ),
    );
  }
}

class _OutlineButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _OutlineButton({required this.label, required this.onTap});

  @override
  State<_OutlineButton> createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<_OutlineButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
              horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color:  _hovered ? AppColors.white : Colors.transparent,
            border: Border.all(
                color: _hovered ? AppColors.white : AppColors.gray),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.spaceGrotesk(
                fontSize:      11,
                fontWeight:    FontWeight.w700,
                color:         _hovered ? AppColors.bg : AppColors.gray,
                letterSpacing: 2.5),
          ),
        ),
      ),
    );
  }
}