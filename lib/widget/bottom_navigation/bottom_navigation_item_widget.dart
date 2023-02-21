import 'package:flexio_kvl/widget/general/touch_feedback/touch_feedback.dart';
import 'package:flexio_kvl/widget/provider/simple_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavigationItemWidget extends StatelessWidget {
  /// This icons is used because I don't have access to the correct svg assets. In a real project this would be an svg asset.
  final IconData icon;
  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  const BottomNavigationItemWidget({
    required this.icon,
    required this.isSelected,
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SimpleProviderWidget(
        childBuilderTheme: (context, theme) => TouchFeedback(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: isSelected ? theme.colors.primary : theme.colors.textSubtle),
                const SizedBox(height: 8),
                Text(
                  text,
                  style: isSelected ? theme.primaryText.body : theme.subtleText.body,
                ),
              ],
            ),
          ),
        ),
      );
}
