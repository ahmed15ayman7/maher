import 'package:flutter/material.dart';

enum ContactButtonStyle {
  gradient,
  gradientBorder,
}

class ContactButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final ContactButtonStyle style;

  const ContactButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.style = ContactButtonStyle.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 58,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF00E1D9), Color(0xFFE100FF)],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: style == ContactButtonStyle.gradient
            ? InkWell(
                onTap: onPressed,
                borderRadius: BorderRadius.circular(10),
                child: _buildButtonContent(),
              )
            : Container(
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Color(0xff1D1E23),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: onPressed,
                  borderRadius: BorderRadius.circular(10),
                  child: _buildButtonContent(),
                ),
              ),
      ),
    );
  }

  Widget _buildButtonContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: style == ContactButtonStyle.gradientBorder
                  ? Color(0xFFFF5BF8)
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: style == ContactButtonStyle.gradient
                  ? Color(0xFFC903C0)
                  : Colors.white,
              size: 20,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "CustomFont",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
