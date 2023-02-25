import 'package:flexio_kvl/model/ev/ev_charge_box.dart';
import 'package:flexio_kvl/theme/theme_dimens.dart';
import 'package:flexio_kvl/widget/general/flexio_card.dart';
import 'package:flexio_kvl/widget/provider/simple_provider.dart';
import 'package:flutter/material.dart';

class EvListItem extends StatelessWidget {
  final EvChargeBox evChargeBox;

  const EvListItem({
    required this.evChargeBox,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleProviderWidget(
      childBuilder: (context, theme, localization) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: FlexioCard(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: theme.colors.primary.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(ThemeDimens.cardBorderRadius),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.electric_car,
                      color: theme.colors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          evChargeBox.title,
                          style: theme.defaultText.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Icon(
                    Icons.arrow_right_alt_rounded,
                    color: theme.colors.primary,
                  ),
                ],
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
