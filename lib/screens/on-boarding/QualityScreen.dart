import 'package:flutter/material.dart';
import 'package:maher/components/ui/GradientButton.dart';
import 'package:maher/components/ui/bg_card.dart';
import 'package:maher/screens/auth/login_screen.dart';
import 'package:maher/widgets/welcome_content_card.dart';

import '../../widgets/logo.dart';

import '../../models/welcome_content_model.dart';

class QualityScreen extends StatelessWidget {
  const QualityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final welcomeContent = const WelcomeContentModel(
      imagePath: 'assets/images/QualityImg.jpg',
      title: 'ستجدون هنا مرادكم',
      description:
          'نقدم لكم خدمات ومنتجات متنوعه تناسب  احتياجاتكم  حسب رغبتكم و نلبيها في موقعكم  بكل سهوله وبضغطة زر نوفر عليك العناه والجهد تطبيق ماهر يقدر وقتك الثمين وصمم خصيصا لخدمتكم',
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back_ios, color: Colors.white),
                    SizedBox(width: 5),
                    Text(
                      'رجوع',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "CustomFont",
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            // Logo
            const LogoWidget(),

            // const Spacer(),

            // Illustration and Welcome Text

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: BgCard(
                    child: Column(children: [
                  WelcomeContent(
                    content: welcomeContent,
                    isDark: true,
                    imageHeight: 150,
                  ),
                  const SizedBox(height: 20),
                  GradientButton(
                    text: "التالي",
                    onTap: () => {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      )
                    },
                  )
                ]))),

            // Next Button
          ],
        ),
      ),
    );
  }
}
