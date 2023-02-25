import 'package:flexio_kvl/theme/theme_durations.dart';
import 'package:flutter/material.dart';

class TouchFeedbackIos extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final BorderRadius? borderRadius;

  const TouchFeedbackIos({
    required this.onTap,
    required this.child,
    this.borderRadius,
    super.key,
  });

  @override
  State<TouchFeedbackIos> createState() => _TouchFeedbackIosState();
}

class _TouchFeedbackIosState extends State<TouchFeedbackIos> {
  var _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius?? BorderRadius.zero,
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedContainer(
          color: _isPressed ? Colors.black.withOpacity(0.05) : Colors.transparent,
          duration: ThemeDurations.shortDuration,
          child: widget.child,
        ),
      ),
    );
  }
}
