import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CurvedNavigationBar(
          index: currentIndex,
          height: 75,
          backgroundColor: Colors.transparent,
          color: const Color(0xFF263238),
          buttonBackgroundColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 300),
          items: [
            _buildNavItem(0, Icons.person, ""),
            _buildNavItem(
                1, Icons.directions_car_outlined, "assets/images/carIcon.png"),
            _buildNavItem(
                2, Icons.percent_outlined, "assets/images/percentIcon.png"),
            _buildNavItem(3, Icons.menu, "assets/images/menuIcon.png"),
            _buildNavItem(4, Icons.home_outlined, "assets/images/homeIcon.png"),
          ],
          onTap: onTap,
        ),
        // Selected item overlay
        if (currentIndex >= 0)
          Positioned(
            top: -25,
            left: 0,
            right: 0,
            child: Container(
              height: 85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < 5; i++)
                    if (i == currentIndex)
                      _buildSelectedIcon(i)
                    else
                      const SizedBox(width: 50),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSelectedIcon(int index) {
    String image = index == 1
        ? "assets/images/carIconW.png"
        : index == 2
            ? "assets/images/percentIconW.png"
            : index == 3
                ? "assets/images/menuIconW.png"
                : "assets/images/homeIconW.png";
    IconData icon = index == 0
        ? Icons.person
        : index == 1
            ? Icons.directions_car_outlined
            : index == 2
                ? Icons.percent_outlined
                : index == 3
                    ? Icons.menu
                    : Icons.home_outlined;

    String label = index == 0
        ? 'حسابي'
        : index == 1
            ? 'سياراتي'
            : index == 2
                ? 'عروضنا'
                : index == 3
                    ? 'حجوزاتي'
                    : 'الرئيسية';

    return Column(
      children: [
        const SizedBox(height: 12),
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF00E1D9), Color(0xFFE100FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: index == 0
              ? Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                )
              : Center(
                  child: Image.asset(
                    image,
                    width: 26, // Adjusted image width
                    height: 27, // Added height to maintain aspect ratio
                    fit: BoxFit.contain, // Ensures the image fits properly
                  ),
                ),
        ),
        const SizedBox(height: 15),
        Text(
          label,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.w500,
              fontFamily: "CustomFont"),
        ),
      ],
    );
  }

  Widget _buildNavItem(int index, IconData? icon, String? image) {
    return index == 0
        ? Icon(
            icon,
            size: 24,
            color: currentIndex == index ? Colors.transparent : Colors.grey,
          )
        : Image.asset(
            '$image',
            width: 24,
          );
  }
}
