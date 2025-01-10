import 'package:flutter/material.dart';
import 'package:maher/components/ui/GradientButton.dart';
import 'package:maher/components/ui/number_pad.dart';
import 'package:maher/components/ui/verification_input.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String verificationCode = '';

  void _handleNumberPress(String number) {
    if (verificationCode.length < 4) {
      setState(() {
        verificationCode += number;
      });
    }
  }

  void _handleBackspace() {
    if (verificationCode.isNotEmpty) {
      setState(() {
        verificationCode =
            verificationCode.substring(0, verificationCode.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF111827), // gray-900
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Header
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      'رجوع',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Logo
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFFa855f7),
                      Color(0xFFec4899),
                    ],
                  ).createShader(bounds),
                  child: const Text(
                    'MAHER',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 48),

                // Verification Text
                const Text(
                  'ادخل رمز التحقق',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'للوصول بشكل آمن إلى هذا التطبيق ، من فضلك قم بإدخال\nرمز التحقق المرسل على الرقم المسجل في التطبيق',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 32),

                // Verification Input
                VerificationInput(
                  value: verificationCode,
                  onChanged: (value) =>
                      setState(() => verificationCode = value),
                ),
                const SizedBox(height: 24),

                // Resend Code
                TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: const TextSpan(
                      text: 'الم يصلك الكود بعد؟ ',
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'اعد ارسال الكود',
                          style: TextStyle(
                            color: Color(0xFFa855f7),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Verify Button
                GradientButton(
                  text: 'تحقق الآن',
                  disabled: verificationCode.length != 4,
                ),
                const SizedBox(height: 32),

                // Number Pad
                Expanded(
                  child: NumberPad(
                    onNumberPress: _handleNumberPress,
                    onBackspace: _handleBackspace,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
