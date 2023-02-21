import 'package:flexio_kvl/theme/theme_durations.dart';
import 'package:flexio_kvl/widget/general/page_view/flexio_tab_bar_item.dart';
import 'package:flexio_kvl/widget/provider/simple_provider.dart';
import 'package:flutter/material.dart';

class FlexioTabBarHomeTabBar extends StatefulWidget {
  final List<String> tabs;
  final PageController controller;

  const FlexioTabBarHomeTabBar({
    required this.tabs,
    required this.controller,
    super.key,
  });

  @override
  State<FlexioTabBarHomeTabBar> createState() => _FlexioTabBarHomeTabBarState();
}

class _FlexioTabBarHomeTabBarState extends State<FlexioTabBarHomeTabBar> {
  var _currentPage = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateState);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleProviderWidget(
      childBuilderTheme: (context, theme) => Row(
        children: [
          for (var i = 0; i < widget.tabs.length; ++i) ...[
            Expanded(
              child: Builder(
                builder: (context) {
                  final text = widget.tabs[i];
                  final isSelected = _currentPage >= i - 0.5 && _currentPage < i + 0.5;
                  return FlexioTabBarItem(
                    text: text,
                    onTap: () => goToPage(i),
                    isSelected: isSelected,
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _updateState() {
    setState(() {
      _currentPage = widget.controller.page?.toInt() ?? 0;
    });
  }

  void goToPage(int page) => widget.controller.animateToPage(page, duration: ThemeDurations.shortDuration, curve: Curves.easeInOut);
}
