import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    required this.text,
    required this.gradient,
  });

  final Text text;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: text,
    );
  }
}
