import 'package:flutter/material.dart';
import 'dart:math';

class GaugePainter extends CustomPainter {
  final double progress; // İbre açısını kontrol etmek için eklendi
  GaugePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 15 // Yayın kalınlığını biraz düşürdük
      ..style = PaintingStyle.stroke;

    final Paint progressPaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 15 // Yayın kalınlığı ayarlandı
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) -
        20; // Yay boyutu biraz küçültüldü

    // Arka plan yayı
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      135 * pi / 180, // 135 dereceyi radyana çevirdik
      270 * pi / 180, // 270 dereceyi radyana çevirdik
      false,
      backgroundPaint,
    );

    // İlerleme yayı
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      135 * pi / 180,
      270 * pi / 180 * progress, // İlerleme oranına göre yayı çizdik
      false,
      progressPaint,
    );

    // İbre Çizimi
    final needlePaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    final needlePath = Path();
    final needleAngle =
        135 * pi / 180 + 270 * pi / 180 * progress; // İbre açısını hesapladık

    final needleLength = radius - 45; // İbre uzunluğunu biraz daha küçülttük
    final needleWidth = 3; // İbre genişliği biraz daha ince yapıldı

    needlePath.moveTo(
      center.dx + cos(needleAngle) * needleLength,
      center.dy + sin(needleAngle) * needleLength,
    );
    needlePath.lineTo(
      center.dx + cos(needleAngle + pi / 2) * needleWidth,
      center.dy + sin(needleAngle + pi / 2) * needleWidth,
    );
    needlePath.lineTo(
      center.dx + cos(needleAngle - pi / 2) * needleWidth,
      center.dy + sin(needleAngle - pi / 2) * needleWidth,
    );
    needlePath.close();

    canvas.drawPath(needlePath, needlePaint);

    // Orta Nokta
    canvas.drawCircle(center, 8, Paint()..color = Colors.white);
    canvas.drawCircle(center, 4, Paint()..color = Colors.orange);

    // Ölçek üzerindeki değerler
    _drawLabels(canvas, size, center, radius);
  }

  void _drawLabels(Canvas canvas, Size size, Offset center, double radius) {
    final textStyle = TextStyle(
      color: Colors.grey.shade800,
      fontSize: 12, // Yazı boyutu biraz daha küçük yapıldı
      fontWeight: FontWeight.bold,
    );

    final labelValues = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
    final labelAngles = [
      135, // 0
      162, // 10
      189, // 20
      216, // 30
      243, // 40
      270, // 50
      297, // 60
      324, // 70
      351, // 80
      378, // 90
      405 // 100
    ];

    for (int i = 0; i < labelValues.length; i++) {
      final angle = labelAngles[i] * pi / 180; // Dereceyi radyana çevirdik
      final offset = Offset(
        center.dx +
            cos(angle) *
                (radius - 20), // Yazıları iç kısma almak için ayarladık
        center.dy +
            sin(angle) *
                (radius - 20), // Yazıları iç kısma almak için ayarladık
      );
      final textSpan = TextSpan(
        text: labelValues[i].toString(),
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(
        canvas,
        Offset(
          offset.dx - textPainter.width / 2,
          offset.dy - textPainter.height / 2,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Dinamik çizim için true
  }
}
