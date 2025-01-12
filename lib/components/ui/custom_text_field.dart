import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? prefix;
  final IconData? prefixIcon;
  final String? placeholder;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;

  final String? Function(String?)? validator;
  final Color placeholderColor;
  final Color textColor;
  final Color? prefixColor;
  final Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    this.label,
    this.prefix,
    this.prefixIcon,
    this.placeholder,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.placeholderColor = const Color(0xFF666666),
    this.textColor = Colors.white,
    this.prefixColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$label',
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF00CED1),
                Color(0xFFFF5BF8),
              ],
            ),
          ),
          padding: EdgeInsets.all(1),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(11),
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
              onChanged: onChanged,
              validator: validator,
              textDirection: TextDirection.rtl,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                border: InputBorder.none,
                hintText: placeholder,
                hintStyle: TextStyle(
                  fontFamily: "CustomFont",
                  color: placeholderColor,
                  fontSize: 16,
                ),
                prefixText: prefix,
                prefixIcon: Icon(prefixIcon),
                prefixStyle: TextStyle(
                  fontFamily: "CustomFont",
                  color: prefixColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
