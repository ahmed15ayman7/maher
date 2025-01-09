import 'package:flutter/material.dart';
import '../models/welcome_content_model.dart';

class WelcomeContent extends StatelessWidget {
  final WelcomeContentModel content;
  final double imageHeight;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

  const WelcomeContent({
    Key? key,
    required this.content,
    this.imageHeight = 200,
    this.titleStyle,
    this.descriptionStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Image.asset(
            content.imagePath,
            height: imageHeight,
          ),
          const SizedBox(height: 30),
          Text(
            content.title,
            textDirection: TextDirection.rtl,
            style: titleStyle ??
                const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 20),
          Text(
            content.description,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: descriptionStyle ??
                const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.5,
                ),
          ),
        ],
      ),
    );
  }
}
