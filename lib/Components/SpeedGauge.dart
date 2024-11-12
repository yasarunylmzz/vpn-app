import 'package:flutter/material.dart';
import 'package:vpn_app/Components/GaugePainter.dart';

class SpeedGauge extends StatelessWidget {
  final double speed; // Hız değerini kontrol etmek için eklendi

  SpeedGauge({super.key, required this.speed});

  @override
  Widget build(BuildContext context) {
    double progress =
        (speed / 100).clamp(0.0, 1.0); // Hızın % olarak hesaplanması

    return Column(
      children: [
        SizedBox(
          height: 246, // Daha büyük bir boyut için artırıldı
          width: 250, // Daha büyük bir boyut için artırıldı
          child: CustomPaint(
            painter: GaugePainter(progress: progress),
          ),
        ),
        Text(
          speed.toStringAsFixed(2),
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'MB/S',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const Icon(Icons.arrow_downward, color: Colors.orange),
      ],
    );
  }
}
