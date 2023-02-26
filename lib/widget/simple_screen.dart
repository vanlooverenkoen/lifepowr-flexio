import 'package:flexio_kvl/theme/theme_dimens.dart';
import 'package:flexio_kvl/widget/general/status_bar/status_bar.dart';
import 'package:flexio_kvl/widget/general/touch_feedback/touch_feedback.dart';
import 'package:flexio_kvl/widget/provider/simple_provider.dart';
import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class SimpleScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool canGoBack;
  final Widget body;
  final Widget? bottomNavigationBar;

  const SimpleScreen({
    required this.title,
    required this.subtitle,
    required this.body,
    this.bottomNavigationBar,
    this.canGoBack = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => StatusBar.dark(
        child: SimpleProviderWidget(
          childBuilder: (context, theme, localization) => Scaffold(
            backgroundColor: theme.colors.background,
            body: SafeArea(
              bottom: bottomNavigationBar == null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (canGoBack) ...[
                              TouchFeedback(
                                borderRadius: BorderRadius.circular(ThemeDimens.circularRadius),
                                onTap: () => Navigator.of(context).pop(),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Icon(
                                    context.isIOSTheme ? Icons.arrow_back_ios_new : Icons.arrow_back,
                                    color: theme.colors.textSubtle,
                                  ),
                                ),
                              ),
                            ],
                            Expanded(
                              child: Text(
                                title,
                                style: theme.primaryText.subtitle,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        if (!canGoBack) ...[
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Casa Koen',
                                  style: theme.defaultText.title,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: theme.defaultText.title.color,
                              ),
                            ],
                          ),
                        ],
                        const SizedBox(height: 8),
                        Text(
                          subtitle,
                          style: theme.secondaryText.subtitle,
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: body),
                ],
              ),
            ),
            bottomNavigationBar: bottomNavigationBar,
          ),
        ),
      );
}
