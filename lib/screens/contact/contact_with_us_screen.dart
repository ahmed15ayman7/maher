import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maher/components/ui/custom_app_bar.dart';
import 'package:maher/components/ui/contact_button.dart';

class ContactData {
  final String text;
  final IconData icon;
  final String link;
  final ContactButtonStyle style;

  ContactData({
    required this.text,
    required this.icon,
    required this.link,
    required this.style,
  });
}

class ContactWithUsScreen extends StatelessWidget {
  ContactWithUsScreen({Key? key}) : super(key: key);

  final List<ContactData> contactButtons = [
    ContactData(
      text: "تواصل معنا",
      icon: Icons.message_rounded,
      link: "chat_link",
      style: ContactButtonStyle.gradient,
    ),
    ContactData(
      text: "اتصل الآن",
      icon: FontAwesomeIcons.phoneFlip,
      link: "tel:+1234567890",
      style: ContactButtonStyle.gradient,
    ),
    ContactData(
      text: "واتساب",
      icon: FontAwesomeIcons.whatsapp,
      link: "whatsapp_link",
      style: ContactButtonStyle.gradientBorder,
    ),
    ContactData(
      text: "انستقرام",
      icon: FontAwesomeIcons.instagram,
      link: "instagram_link",
      style: ContactButtonStyle.gradientBorder,
    ),
    ContactData(
      text: '"تويتر "اكس',
      icon: FontAwesomeIcons.xTwitter,
      link: "twitter_link",
      style: ContactButtonStyle.gradientBorder,
    ),
    ContactData(
      text: "تيك توك",
      icon: FontAwesomeIcons.tiktok,
      link: "tiktok_link",
      style: ContactButtonStyle.gradientBorder,
    ),
    ContactData(
      text: "البريد الالكتروني",
      icon: FontAwesomeIcons.envelope,
      link: "mailto:example@email.com",
      style: ContactButtonStyle.gradientBorder,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D1E23),
      appBar: CustomAppBar(title: "تواصل معنا"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                "نحن هنا لخدمتك في اي وقت واينما كنت",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "لا تتردد في التواصل معنا اذا كان لديك اي استفسار\nاو واجهت اي صعوبة",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ...contactButtons.map((contact) => ContactButton(
                    text: contact.text,
                    icon: contact.icon,
                    style: contact.style,
                    onPressed: () {
                      // Handle button press based on contact.link
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
