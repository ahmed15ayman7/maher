import 'package:flutter/material.dart';

class GradientBorderButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final List<Color> gradientColors;
  final double borderWidth;
  final double borderRadius;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final double? iconSpacing;

  const GradientBorderButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.icon,
    this.iconColor,
    this.iconSize = 20,
    this.iconSpacing = 8,
    this.gradientColors = const [
      Color(0xFF00CED1),
      Color(0xFFFF5BF8),
      Color(0xFFC903C0),
    ],
    this.borderWidth = 1,
    this.borderRadius = 12,
    this.backgroundColor = const Color(0xFF1E1E1E),
    this.padding = const EdgeInsets.symmetric(vertical: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          colors: gradientColors,
        ),
      ),
      padding: EdgeInsets.all(borderWidth),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius - 1),
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: padding,
            minimumSize: const Size(double.infinity, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius - 1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: iconColor ?? gradientColors.last,
                  size: iconSize,
                ),
                SizedBox(width: iconSpacing),
              ],
              child,
            ],
          ),
        ),
      ),
    );
  }
}
