import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String? endText;
  final IconData? endIcon;
  final VoidCallback? onBackPressed;
  final VoidCallback? onActionPressed;
  final bool showBackButton;
  final bool showEndText;
  final bool showEndIcon;
  final String? image;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.endText,
    this.endIcon,
    this.onBackPressed,
    this.onActionPressed,
    this.image,
    this.showEndText = false,
    this.showEndIcon = false,
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
            Row(children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
              ),
              Text(
                "رجوع",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "CustomFont",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Image.asset(
                    '$image',
                    width: 20,
                  ),
                ),
              if (image != null) SizedBox(width: 10),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (showEndText)
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextButton(
                        onPressed: onActionPressed,
                        child: Text(
                          '$endText',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "CustomFont",
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
              if (showEndIcon)
                Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: IconButton(
                        onPressed: onActionPressed,
                        icon: Icon(
                          endIcon,
                          size: 24,
                          color: Colors.white,
                        ))) // Placeholder for spacing when no back button
            ],
          ),
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
