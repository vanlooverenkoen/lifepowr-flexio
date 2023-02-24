import 'package:flexio_kvl/widget/general/status_bar/status_bar.dart';
import 'package:flexio_kvl/widget/provider/simple_provider.dart';
import 'package:flutter/material.dart';

class SimpleScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget body;
  final Widget? bottomNavigationBar;

  const SimpleScreen({
    required this.title,
    required this.subtitle,
    required this.body,
    this.bottomNavigationBar,
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
                        Text(
                          title,
                          style: theme.primaryText.subtitle,
                        ),
                        const SizedBox(height: 8),
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
