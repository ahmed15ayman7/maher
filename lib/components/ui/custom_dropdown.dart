import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String? selectedValue;
  final VoidCallback onTap;
  final Icon? leadingIcon; // Optional leading icon
  final List<Color> gradientColors;
  final double borderWidth;
  final double borderRadius;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  const CustomDropdown({
    Key? key,
    required this.label,
    required this.selectedValue,
    required this.onTap,
    this.leadingIcon,
    this.gradientColors = const [
      Color(0xFF00CED1),
      Color(0xFFFF5BF8),
    ],
    this.borderWidth = 1,
    this.borderRadius = 12,
    this.backgroundColor = const Color(0xFF1E1E1E),
    this.padding = const EdgeInsets.symmetric(
        vertical: 16), // Allow null to keep it optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
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
                      child: GestureDetector(
                        onTap: onTap,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                          child: Row(
                            children: [
                              if (leadingIcon != null) ...[
                                leadingIcon!, // Display the icon if provided
                                const SizedBox(width: 8), // Add spacing
                              ],
                              Expanded(
                                child: Text(
                                  selectedValue ?? 'قائمة ماركات السيارات',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            )));
  }
}
