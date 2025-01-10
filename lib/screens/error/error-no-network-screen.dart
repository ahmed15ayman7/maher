import 'package:flutter/material.dart';
import 'package:maher/models/welcome_content_model.dart';
import 'package:maher/widgets/logo.dart';
import 'package:maher/widgets/welcome_content_card.dart';

class ErrorNoNetworkScreen extends StatelessWidget {
  const ErrorNoNetworkScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D1E23),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(),
            const SizedBox(height: 30),
            const Text(
              "4 0 1",
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                  fontFamily: "CustomFont",
                  fontSize: 35),
            ),
            const WelcomeContent(
                titleStyle: TextStyle(
                    fontSize: 15,
                    fontFamily: "CustomFont",
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                content: WelcomeContentModel(
                    title: "تأكد من اتصالك بالانترنت",
                    imagePath: "assets/images/401-Error.png",
                    description:
                        "عذرًا، لم نتمكن من الوصول إلى الصفحة. يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى."))
          ],
        ),
      ),
    );
  }
}
