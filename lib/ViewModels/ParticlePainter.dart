



// ─── PARTICLE PAINTER ─────────────────────────────────────────────────────────
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

import '../Utils/AppColors.dart';

class ParticlePainter extends CustomPainter {
  final double progress;
  ParticlePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.white.withOpacity(0.18)
      ..strokeWidth = 1;

    final dotPaint = Paint()..color = AppColors.white.withOpacity(0.25);

    final rng = math.Random(42);
    const cols = 36;
    const rows = 22;
    final spacingX = size.width / cols;
    final spacingY = size.height / rows;

    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        final baseX = col * spacingX + spacingX / 2;
        final baseY = row * spacingY + spacingY / 2;

        // Wave distortion
        final wave = math.sin(
            (col / cols * 2 * math.pi) + (progress * 2 * math.pi) - (row * 0.3)) *
            (size.height * 0.06);
        final x = baseX + rng.nextDouble() * 4 - 2;
        final y = baseY + wave + rng.nextDouble() * 4 - 2;

        final distFromRight = (size.width - baseX) / size.width;
        final inWaveZone = distFromRight > 0.35 && distFromRight < 0.85;

        if (inWaveZone) {
          canvas.drawCircle(Offset(x, y), 1.0, dotPaint);
        } else {
          canvas.drawCircle(
            Offset(x, y),
            0.5,
            Paint()..color = AppColors.white.withOpacity(0.07),
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(ParticlePainter old) => old.progress != progress;
}
