import 'package:flutter/material.dart';
import 'package:maher/components/ui/GradientButton2.dart';
import 'package:maher/components/ui/bg_card.dart';
import 'package:maher/screens/on-boarding/QualityScreen.dart';
import 'package:maher/widgets/welcome_content_card.dart';

import '../../widgets/logo.dart';

import '../../models/welcome_content_model.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final welcomeContent = const WelcomeContentModel(
      imagePath: 'assets/images/hello.jpg',
      title: 'أهلاً وسهلاً منورين 🤩',
      description:
          'مرحبا بكم في تطبيقكم الامثل للخدمات والمنتجات الخاصة بالسيارات\nكل ماتحتاجه لسيارتك في مكان واحد\nتسوق بسهوله وسرعه واطلب خدمتك وطلباتكم اوامر',
    );

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(backgroundColor: Colors.transparent),
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
                    imageHeight: 170,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GradientButton2(
                        icon: Icons.arrow_forward_ios,
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QualityScreen(),
                            ),
                          )
                        },
                      )
                    ],
                  )
                ]))),

            // Next Button
          ],
        ),
      ),
    );
  }
}
