import 'package:flutter/material.dart';
import '../models/welcome_content_model.dart';

class WelcomeContent extends StatelessWidget {
  final WelcomeContentModel content;
  final double imageHeight;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final bool isDark;
  const WelcomeContent({
    Key? key,
    required this.content,
    this.imageHeight = 200,
    this.titleStyle,
    this.isDark = false,
    this.descriptionStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            content.imagePath,
            height: imageHeight,
          ),
          const SizedBox(height: 20),
          Text(content.title,
              textDirection: TextDirection.rtl,
              style: titleStyle ??
                  TextStyle(
                    fontSize: 18,
                    fontFamily: "CustomFont",
                    fontWeight: FontWeight.bold,
                    color: isDark ? Color(0xffFF5BF8) : Colors.white,
                  ),
              textAlign: TextAlign.center),
          const SizedBox(height: 15),
          Text(
            content.description,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: descriptionStyle ??
                TextStyle(
                  fontFamily: "CustomFont",
                  fontSize: 12,
                  color: isDark ? Color(0xff263238) : Colors.white70,
                  height: 1.5,
                ),
          ),
        ],
      ),
    );
  }
}
