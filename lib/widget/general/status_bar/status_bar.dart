import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar extends StatelessWidget {
  final Widget child;
  final bool isDarkStyle;

  const StatusBar.dark({
    required this.child,
    super.key,
  }) : isDarkStyle = true;

  const StatusBar.light({
    required this.child,
    super.key,
  }) : isDarkStyle = false;

  const StatusBar.animated({
    required this.child,
    required this.isDarkStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDarkStyle
          ? SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.transparent)
          : SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.transparent),
      child: child,
    );
  }
}
