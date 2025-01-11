import 'package:flutter/material.dart';
import 'package:maher/models/welcome_content_model.dart';
import 'package:maher/screens/location/select_location_screen.dart';
import 'package:maher/widgets/welcome_content_card.dart';
import '../../components/ui/custom_app_bar.dart';
import '../../components/ui/GradientButton.dart';
import '../../components/ui/gradient_border_button.dart';
import 'package:geolocator/geolocator.dart';

class WaySelectLocationScreen extends StatelessWidget {
  const WaySelectLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _handleLocationPermission(BuildContext context) async {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('الرجاء تفعيل خدمات الموقع في إعدادات جهازك'),
        ));
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('تم رفض إذن الوصول إلى الموقع'),
          ));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'تم رفض إذن الوصول إلى الموقع بشكل دائم. الرجاء تفعيله من إعدادات التطبيق'),
        ));
        return;
      }

      // Get current position
      try {
        Position position = await Geolocator.getCurrentPosition();
        // Here you can handle the position, for example navigate to a new screen
        // or store it in your state management solution
        print(
            'Latitude: ${position.latitude}, Longitude: ${position.longitude}');

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('تم تحديد موقعك بنجاح'),
          backgroundColor: Colors.green,
        ));

        // Navigate to select location screen with the position data
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectLocationScreen(
                latitude: position.latitude,
                longitude: position.longitude,
              ),
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('حدث خطأ أثناء تحديد موقعك'),
            backgroundColor: Colors.red,
          ));
        }
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: CustomAppBar(
        title: 'آلية تحديد موقعك',
        showBackButton: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Welcome Card with Image
              WelcomeContent(
                  content: WelcomeContentModel(
                      description: "",
                      imagePath: "assets/images/Location.png",
                      title: "اختر الية تحديد الموقع الخاص بك!")),
              const SizedBox(height: 40),
              // const Spacer(),
              // Gradient Button
              GradientButton(
                onTap: () {
                  _handleLocationPermission(context);
                },
                text: 'تفعيل الموقع',
              ),
              const SizedBox(height: 16),
              // Gradient Border Button
              GradientBorderButton(
                onPressed: () {
                  // Handle manual location
                },
                child: Text('تحديد موقعك يدويا'),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
