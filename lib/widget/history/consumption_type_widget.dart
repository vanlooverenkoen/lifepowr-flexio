import 'package:flexio_kvl/theme/theme_dimens.dart';
import 'package:flutter/material.dart';

class ConsumptionTypeWidget extends StatelessWidget {
  final String title;
  final Color color;

  const ConsumptionTypeWidget({
    required this.title,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(ThemeDimens.circularRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: RichText(
          text: TextSpan(
            children: [
              const WidgetSpan(
                child: Icon(
                  Icons.circle,
                  size: 8,
                  color: Colors.white,
                ),
                alignment: PlaceholderAlignment.middle,
              ),
              const WidgetSpan(
                child: SizedBox(width: 4),
                alignment: PlaceholderAlignment.middle,
              ),
              TextSpan(
                text: title,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      );
}
