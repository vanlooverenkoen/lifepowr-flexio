import 'package:flexio_kvl/theme/theme_dimens.dart';
import 'package:flexio_kvl/widget/general/flexio_card.dart';
import 'package:flexio_kvl/widget/provider/simple_provider.dart';
import 'package:flutter/material.dart';

class EvInfoContainer extends StatelessWidget {
  const EvInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleProviderWidget(
      childBuilder: (context, theme, localization) => Padding(
        padding: const EdgeInsets.all(16),
        child: FlexioCard(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: theme.colors.primary.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(ThemeDimens.cardBorderRadius),
                  border: Border.all(
                    color: theme.colors.primary.withOpacity(0.5),
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(8),

                /// This will be an svg in a production application. This is just a placeholder.
                child: Icon(
                  Icons.lightbulb_outlined,
                  color: theme.colors.primary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Choose urgent charging when you have to leave the house quickly. Otherwise, it is best to choose smart charging or another charing method.',
                  style: theme.primaryText.body,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
