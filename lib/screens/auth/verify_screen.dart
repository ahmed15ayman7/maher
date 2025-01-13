import 'package:flutter/material.dart';
import 'package:maher/components/ui/GradientButton.dart';
import 'package:maher/components/ui/bg_card.dart';
import 'package:maher/components/ui/bottomSheet.dart';
import 'package:maher/components/ui/number_pad.dart';
import 'package:maher/components/ui/verification_input.dart';
import 'package:maher/models/welcome_content_model.dart';
import 'package:maher/screens/home/home_screen.dart';
import 'package:maher/screens/location/way_select_location_screen.dart';
import 'package:maher/widgets/logo.dart';
import 'package:maher/widgets/welcome_content_card.dart';

class VerificationScreen extends StatefulWidget {
  final bool showBottomSheet;
  const VerificationScreen({
    Key? key,
    this.showBottomSheet = false,
  }) : super(key: key);

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

  @override
  void initState() {
    super.initState();
    if (widget.showBottomSheet) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showSuccessBottomSheet(context);
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

  void _showSuccessBottomSheet(BuildContext context) {
    CustomBottomSheet.show(
      initialChildSize: 0.7,
      context: context,
      builder: (sheetContext) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WelcomeContent(
              content: WelcomeContentModel(
                  imagePath: "assets/images/VerificationSuccess.png",
                  title: widget.showBottomSheet
                      ? "تمت عملية حفظ الموقع بنجاح"
                      : 'تمت عملية التحقق بنجاح',
                  description: widget.showBottomSheet
                      ? ""
                      : 'ابدا تجربتك الان بافضل تطبيق يقدم خدمات و منتجات للسيارات')),
          SizedBox(height: 30),
          GradientButton(
            text: widget.showBottomSheet
                ? "اذهب للصفحة الرئيسية"
                : 'ابدء تجربة الان',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => widget.showBottomSheet
                          ? HomeScreen()
                          : WaySelectLocationScreen()));
            },
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
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
        backgroundColor: const Color(0xFF1D1E23), // gray-900
        body: SafeArea(
          child: Stack(
            children: [
              // Logo at the top
              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: const LogoWidget(height: 60),
              ),
              // BgCard at the bottom 3/4 of the screen
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: BgCard(
                  isDark: true,
                  height: MediaQuery.of(context).size.height *
                      0.75, // 3/4 height of the screen
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Verification Text
                        const Text(
                          'ادخل رمز التحقق',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "CustomFont"),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'للوصول بشكل آمن إلى هذا التطبيق ، من فضلك قم بإدخال\nرمز التحقق المرسل على الرقم المسجل في التطبيق',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontFamily: "CustomFont"),
                        ),
                        const SizedBox(height: 16),

                        // Verification Input
                        VerificationInput(
                          value: verificationCode,
                          onChanged: (value) =>
                              setState(() => verificationCode = value),
                        ),
                        const SizedBox(height: 20),

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
                        const SizedBox(height: 20),

                        // Verify Button
                        GradientButton(
                          text: 'تحقق الآن',
                          disabled: verificationCode.length != 4,
                          onTap: () {
                            _showSuccessBottomSheet(context);
                          },
                        ),
                        const SizedBox(height: 15),

                        // Number Pad
                        NumberPad(
                          onNumberPress: _handleNumberPress,
                          onBackspace: _handleBackspace,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
