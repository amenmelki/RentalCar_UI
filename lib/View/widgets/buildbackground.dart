import 'dart:ui';
import 'package:flutter/material.dart';

class BuildBackground extends StatelessWidget {
  const BuildBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // First Layer - White (100% Opacity)
        Container(
          color: Colors.white,
        ),
        // Second Layer - Gradient (67% HEX(7668E5) top left and 85% HEX(4530B1) bottom center)
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF7668E5).withOpacity(0.67),
                const Color(0xFF4530B1).withOpacity(0.85),
              ],
            ),
          ),
        ),
        // Third Layer - HEX(0085FF) (65% Opacity)
        Opacity(
          opacity: 0.65,
          child: Container(
            color: const Color(0xFF0085FF),
          ),
        ),
        // Fourth Layer - White Gradient (85% top left and 70% bottom center)
        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.85),
                Colors.white.withOpacity(0.7),
              ],
            ).createShader(bounds);
          },
          child: Container(
            color: Colors.white,
          ),
        ),
        // Fifth Layer - White (20% Opacity) with BackdropFilter
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.white.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
