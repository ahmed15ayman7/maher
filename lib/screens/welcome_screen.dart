import 'package:flutter/material.dart';
import 'package:maher/components/ui/GradientButton.dart';
import 'package:maher/components/ui/bg_card.dart';
import 'package:maher/widgets/welcome_content_card.dart';

import '../widgets/logo.dart';

import '../models/welcome_content_model.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final welcomeContent = WelcomeContentModel(
      imagePath: 'assets/images/hello.jpg',
      title: 'أهلاً وسهلاً منورين 🤩',
      description:
          'مرحبا بكم في تطبيقكم الامثل للخدمات والمنتجات الخاصة بالسيارات\nكل ماتحتاجه لسيارتك في مكان واحد\nتسوق بسهوله وسرعه واطلب خدمتك وطلباتكم اوامر',
    );

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Logo
            const LogoWidget(),

            const Spacer(),

            // Illustration and Welcome Text

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BgCard(
                  child: Column(children: [
                WelcomeContent(content: welcomeContent),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GradientButton(
                    text: "التالي",
                  ),
                ),
                const SizedBox(height: 20),
              ])),
            ),

            // Next Button
          ],
        ),
      )),
    );
  }
}
