import 'package:flexio_kvl/theme/theme_dimens.dart';
import 'package:flexio_kvl/widget/general/touch_feedback/touch_feedback.dart';
import 'package:flexio_kvl/widget/provider/simple_provider.dart';
import 'package:flutter/material.dart';

class SelectorWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SelectorWidget({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleProviderWidget(
      childBuilder: (context, theme, localization) => Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colors.backgroundLight,
          borderRadius: BorderRadius.circular(ThemeDimens.cardBorderRadius),
          boxShadow: [
            BoxShadow(
              color: theme.colors.shadowColor,
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: TouchFeedback(
          onTap: onTap,
          borderRadius: BorderRadius.circular(ThemeDimens.cardBorderRadius),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: theme.defaultText.body,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: theme.colors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
