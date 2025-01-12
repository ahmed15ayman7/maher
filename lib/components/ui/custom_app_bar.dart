import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final bool showBackButton;
  final String? image;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBackPressed,
    this.image,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF00E1D9),
            Color(0xFFE100FF),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showBackButton)
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            ),
          Row(
            children: [
              if (image != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Image.asset(
                    '$image',
                    width: 20,
                  ),
                ),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "CustomFont",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(width: 48), // Placeholder for spacing when no back button
        ],
      ),
    );
  }
}

class PositionedAppBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content here
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomAppBar(
              title: "Custom Title",
              image: 'assets/logo.png',
              onBackPressed: () {
                // Handle back button action
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
