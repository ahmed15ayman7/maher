import 'package:flutter/material.dart';
import 'package:maher/components/ui/custom_app_bar.dart';
import 'package:maher/components/ui/custom_bottom_nav_bar.dart';
import 'package:maher/screens/car/my_car_screen.dart';
import 'package:maher/screens/reservations/reservations_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 4; // Start with home selected

  final List<String> _title = [
    "صفحتي",
    "سياراتي",
    "عروضاتنا",
    "حجوزاتي",
    "الصفحة الرئيسية",
  ];
  final List<Widget> _screens = [
    Center(
        child: Text('Screen 1',
            style: TextStyle(color: Colors.white))), // Example Screen
    MyCarScreen(), // Example Screen
    Center(
        child: Text('Screen 3',
            style: TextStyle(color: Colors.white))), // Example Screen
    const ReservationsScreen(), // Replace with your ReservationsScreen
    Center(
        child:
            Text('Home', style: TextStyle(color: Colors.white))), // Home Screen
  ];
  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1E23),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            CustomAppBar(title: _title[_currentIndex]),
            _screens[_currentIndex],
          ],
        )),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }
}
