import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final bool showBackButton;
  final String? image;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBackPressed,
    this.image,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF00E1D9),
              Color(0xFFE100FF),
            ],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(children: [
              if (image != null) SizedBox(width: 60),
              if (image != null)
                Image.asset(
                  '$image',
                  width: 20,
                ),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "CustomFont",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            leading: showBackButton
                ? IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed:
                        onBackPressed ?? () => Navigator.of(context).pop(),
                  )
                : null,
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
