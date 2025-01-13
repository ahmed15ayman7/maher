import 'package:flutter/material.dart';
import 'package:maher/components/ui/GradientButton.dart';
import 'package:maher/components/ui/bg_card.dart';
import 'package:maher/components/ui/custom_text_field.dart';
import 'package:maher/components/ui/gradient_border_button.dart';
import 'package:maher/components/ui/gradient_line.dart';
import 'package:maher/screens/auth/register_screen.dart';
import 'package:maher/screens/home/home_screen.dart';
import 'package:maher/widgets/logo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              const LogoWidget(),
              const SizedBox(height: 40),
              const Spacer(),
              SingleChildScrollView(
                  child: BgCard(
                isDark: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'تسجيل الدخول',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: "CustomFont"),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      label: 'رقم الهاتف',
                      prefix: '+966 |',
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 24),
                    GradientButton(
                      text: "التالي",
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()));
                          },
                          child: const Text(
                            'سجل الآن',
                            style: TextStyle(
                              color: Color(0xFFFF5BF8),
                              fontFamily: "CustomFont",
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const Text(
                          'ليس لديك حساب؟',
                          style: TextStyle(
                              color: Colors.white, fontFamily: "CustomFont"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GradientLine(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          width: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "و",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00D2FF),
                                fontFamily: "CustomFont"
                                // Gradient-like color for the text
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            "أ",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF00FF),
                                fontFamily: "CustomFont"
                                // Gradient-like color for the text
                                ),
                          ),
                        ),
                        GradientLine(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          width: 100,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GradientBorderButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      child: const Text(
                        'تخطي تسجيل الدخول',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
