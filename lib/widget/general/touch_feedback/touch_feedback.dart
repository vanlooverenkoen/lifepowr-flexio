import 'package:flexio_kvl/widget/general/touch_feedback/touch_feedback_ios.dart';
import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class TouchFeedback extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final BorderRadius? borderRadius;

  const TouchFeedback({
    required this.onTap,
    required this.child,
    this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isAndroidTheme) {
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: InkWell(
          onTap: onTap,
          child: Container(
            child: child,
          ),
        ),
      );
    }
    return TouchFeedbackIos(
      onTap: onTap,
      borderRadius: borderRadius,
      child: child,
    );
  }
}
