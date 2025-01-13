import 'package:flutter/material.dart';
import 'package:maher/components/ui/GradientButton2.dart';
import 'package:maher/components/ui/WavyClipper.dart';
import 'package:maher/components/ui/bg_card.dart';

class CustomBottomSheet extends StatelessWidget {
  final BuildContext parentContext;
  final Widget child;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final bool isDismissible;
  final bool isIcon;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final Function(BuildContext)? onDismiss;

  const CustomBottomSheet({
    Key? key,
    required this.parentContext,
    required this.child,
    this.initialChildSize = 0.5,
    this.minChildSize = 0.5,
    this.maxChildSize = 0.95,
    this.isDismissible = true,
    this.isIcon = true,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
    this.onDismiss,
  }) : super(key: key);

  static void show({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    double initialChildSize = 0.5,
    double minChildSize = 0.5,
    double maxChildSize = 0.95,
    bool isDismissible = true,
    bool isIcon = true,
    Color? backgroundColor,
    EdgeInsets? padding,
    Function(BuildContext)? onDismiss,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      builder: (sheetContext) => CustomBottomSheet(
        parentContext: context,
        child: builder(sheetContext),
        initialChildSize: initialChildSize,
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        isDismissible: isDismissible,
        backgroundColor: backgroundColor,
        padding: padding,
        onDismiss: onDismiss,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onDismiss != null) {
          onDismiss!(context);
        }
        return true;
      },
      child: DraggableScrollableSheet(
        initialChildSize: initialChildSize,
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        builder: (_, controller) => Stack(
          children: [
            // Custom Painted Background
            Positioned(
                top: 20,
                left: 0,
                right: 0,
                bottom: 0,
                child: ClipPath(
                  clipper: isIcon ? WavyClipper() : null,
                  child: BgCard(
                    padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                    isCustom: true,
                    child: SingleChildScrollView(
                      controller: controller,
                      child: Padding(
                        padding: padding ?? EdgeInsets.zero,
                        child: child,
                      ),
                    ),
                  ),
                )),

            // Close Button
            if (isIcon)
              Positioned(
                top: 0,
                left: 65,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientButton2(
                      radius: 50,
                      icon: Icons.close,
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
