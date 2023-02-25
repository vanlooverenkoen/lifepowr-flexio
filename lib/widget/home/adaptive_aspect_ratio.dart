import 'dart:io';

import 'package:flutter/widgets.dart';

class AdaptiveRatio extends StatelessWidget {
  final Widget child;

  const AdaptiveRatio({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) return child;
    return LayoutBuilder(
      builder: (context, constraints) {
        var aspectRatio = 16 / 9;
        final width = constraints.maxWidth;
        if (width >= 2000) {
          aspectRatio = 16 / 4;
        } else if (width >= 1500) {
          aspectRatio = 16 / 6;
        }
        return AspectRatio(
          aspectRatio: aspectRatio,
          child: child,
        );
      },
    );
  }
}
