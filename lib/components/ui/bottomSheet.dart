import 'package:flutter/material.dart';
import 'package:maher/components/ui/bg_card.dart';

class CustomBottomSheet extends StatelessWidget {
  final BuildContext parentContext;
  final Widget child;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final bool isDismissible;
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
        builder: (_, controller) => BgCard(
          isCustom: true,
          child: SingleChildScrollView(
            controller: controller,
            child: SafeArea(
              child: Padding(
                padding: padding ?? EdgeInsets.zero,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
