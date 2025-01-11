import 'package:flutter/material.dart';
import 'package:maher/models/welcome_content_model.dart';
import '../../components/ui/custom_app_bar.dart';
import '../../components/ui/gradient_border_button.dart';
import '../../components/ui/GradientButton.dart';
import '../../widgets/welcome_content_card.dart';

class ErrorLocationScreen extends StatelessWidget {
  const ErrorLocationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String name = 'عبد العزيز';
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: CustomAppBar(
        title: 'حدد موقعك',
        image: "/assets/images/LocationIconW.png",
        showBackButton: true,
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              GradientBorderButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'RRAB2886, 2886, 6332 الرياض',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      "assets/images/LocationIcon.png",
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      print("kkkk");
                    },
                    child: Text(
                      '$name ؟',
                      style: TextStyle(
                        color: Color(0xFFFF5BF8),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const Text(
                    'كيف يمكننا تقديم خدماتنا لك اليوم،',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const WelcomeContent(
                  content: WelcomeContentModel(
                      imagePath: 'assets/images/location-Error.png',
                      title: 'عذراً، خدماتنا غير موجودة في موقعك الحالي',
                      description: '')),
              GradientButton(
                onTap: () {},
                text: 'تواصل معنا',
              ),
              const SizedBox(height: 62),
            ],
          ),
        ),
      ),
    );
  }
}
