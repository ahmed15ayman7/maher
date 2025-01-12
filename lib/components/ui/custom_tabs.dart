import 'package:flutter/material.dart';

class TabItem {
  final String title;
  final IconData? icon;

  TabItem({
    required this.title,
    this.icon,
  });
}

class CustomTabs extends StatefulWidget {
  final List<TabItem> tabs;
  final Function(int) onTabSelected;
  final int selectedIndex;

  const CustomTabs({
    Key? key,
    required this.tabs,
    required this.onTabSelected,
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  State<CustomTabs> createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xff263238), // Black background for the container
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between tabs
        children: widget.tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isSelected = index == widget.selectedIndex;
          return GestureDetector(
            onTap: () => widget.onTabSelected(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                gradient: isSelected
                    ? const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF00E1D9), Color(0xFFE100FF)],
                      )
                    : null,
                color: isSelected ? null : const Color(0xff263238),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  if (tab.icon != null) ...[
                    Icon(
                      tab.icon,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    tab.title,
                    style: TextStyle(
                      fontFamily: "CustomFont",
                      color: Colors.white,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
