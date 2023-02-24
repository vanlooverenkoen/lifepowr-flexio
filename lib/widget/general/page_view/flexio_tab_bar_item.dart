import 'package:flexio_kvl/theme/theme_dimens.dart';
import 'package:flexio_kvl/theme/theme_durations.dart';
import 'package:flexio_kvl/widget/general/touch_feedback/touch_feedback.dart';
import 'package:flexio_kvl/widget/provider/simple_provider.dart';
import 'package:flutter/widgets.dart';

class FlexioTabBarItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  const FlexioTabBarItem({
    required this.text,
    required this.onTap,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleProviderWidget(
      childBuilderTheme: (context, theme) => TouchFeedback(
        onTap: onTap,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: AnimatedDefaultTextStyle(
                style: isSelected ? theme.primaryText.subtitle : theme.secondaryText.subtitle,
                curve: Curves.easeInOut,
                duration: ThemeDurations.shortDuration,
                child: Text(text),
              ),
            ),
            AnimatedContainer(
              duration: ThemeDurations.shortDuration,
              height: 2,
              color: isSelected ? theme.colors.primary : theme.colors.dividerColor,
            ),
          ],
        ),
      ),
    );
  }
}
