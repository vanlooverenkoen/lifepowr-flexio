import 'package:flexio_kvl/theme/theme_dimens.dart';
import 'package:flexio_kvl/widget/provider/simple_provider.dart';
import 'package:flutter/widgets.dart';

class FlexioCard extends StatelessWidget {
  final Widget child;

  const FlexioCard({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleProviderWidget(
      childBuilderTheme: (context, theme) => Container(
        decoration: BoxDecoration(
          color: theme.colors.backgroundLight,
          borderRadius: BorderRadius.circular(ThemeDimens.cardBorderRadius),
          boxShadow: [
            BoxShadow(
              color: theme.colors.shadowColor,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
