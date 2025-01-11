import 'package:flutter/material.dart';
import 'package:maher/components/ui/GradientButton.dart';
import 'package:maher/components/ui/bg_card.dart';
import 'package:maher/components/ui/custom_text_field.dart';
import 'package:maher/components/ui/gradient_checkbox.dart';
import 'package:maher/screens/auth/verify_screen.dart';
import 'package:maher/widgets/logo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _acceptTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            const LogoWidget(height: 60),
            const SizedBox(height: 20),
            const Spacer(),
            SingleChildScrollView(
              child: BgCard(
                  isDark: true,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'تسجيل جديد',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: 'الاسم',
                          placeholder: 'اكتب اسمك بالكامل',
                          controller: _nameController,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          label: 'البريد الالكتروني',
                          placeholder: 'example@gmail.com',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          label: 'رقم الهاتف',
                          prefix: '+966',
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            GradientCheckbox(
                              value: _acceptTerms,
                              onChanged: (value) {
                                setState(() {
                                  _acceptTerms = value ?? false;
                                });
                              },
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: RichText(
                                textDirection: TextDirection.rtl,
                                text: const TextSpan(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                  children: [
                                    TextSpan(text: 'بالتسجيل أنت توافق على '),
                                    TextSpan(
                                      text: 'الشروط و الأحكام',
                                      style: TextStyle(
                                        color: Color(0xFFFF5BF8),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    TextSpan(text: ' و أنك قد قرأت '),
                                    TextSpan(
                                      text: 'سياسة الخصوصية',
                                      style: TextStyle(
                                        color: Color(0xFFFF5BF8),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        GradientButton(
                          text: 'تسجيل',
                          onTap: !_acceptTerms
                              ? () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VerificationScreen()));
                                }
                              : null,
                        ),
                      ])),
            )
          ],
        ),
      ),
    );
  }
}
