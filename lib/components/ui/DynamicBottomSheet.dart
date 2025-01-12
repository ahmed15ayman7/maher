import 'package:flutter/material.dart';
import 'package:maher/components/ui/GradientButton.dart';

void _showSuccessBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.95,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, controller) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1D1E23),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          controller: controller,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/VerificationSuccess.png"),
                  const SizedBox(height: 40),
                  const Text(
                    'تمت عملية التحقق بنجاح',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'ابدا تجربتك الان بافضل تطبيق يقدم خدمات و منتجات للسيارات',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  GradientButton(
                    text: 'ابدء تجربة الان',
                    onTap: () {
                      // Navigate to next screen
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
