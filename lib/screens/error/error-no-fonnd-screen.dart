import 'package:flutter/material.dart';
import 'package:maher/components/ui/CustomTextRow.dart';
import 'package:maher/components/ui/GradientButton.dart';
import 'package:maher/models/welcome_content_model.dart';
import 'package:maher/widgets/logo.dart';
import 'package:maher/widgets/welcome_content_card.dart';

class ErrorNoFoundScreen extends StatelessWidget {
  const ErrorNoFoundScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D1E23),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(),
            const WelcomeContent(
              titleStyle: TextStyle(
                  fontSize: 15,
                  fontFamily: "CustomFont",
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              content: WelcomeContentModel(
                  title: "الصفحة غير موجودة",
                  imagePath: "assets/images/404-Error.png",
                  description:
                      "عذرًا، لم نتمكن من العثور على الصفحة. يرجى العودة إلى الصفحة الرئيسية أو التواصل معنا للمساعدة."),
            ),
            GradientButton(
              text: "الصفحة الرئيسية",
              // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const )),
            ),
            SizedBox(height: 20),
            GradientButton(
              text: "تواصل معنا",
              // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const )),
            ),
            Center(
              child: Column(
                children: [
                  const CustomTextRow(label: "URL", value: "https://xxx"),
                  const SizedBox(height: 10),
                  const CustomTextRow(
                      label: "Server", value: "gbridge.033001233211.us44"),
                  const SizedBox(height: 10),
                  const CustomTextRow(
                      label: "Date", value: "2024/12/21 21:30:04"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
