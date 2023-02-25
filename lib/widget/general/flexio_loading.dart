import 'package:flexio_kvl/widget/provider/simple_provider.dart';
import 'package:flutter/material.dart';

class FlexioLoading extends StatelessWidget {
  const FlexioLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleProviderWidget(
      childBuilder: (context, theme, localization) => CircularProgressIndicator(color: theme.colors.primary),
    );
  }
}
