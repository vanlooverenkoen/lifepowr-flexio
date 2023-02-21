import 'package:flexio_kvl/widget/general/page_view/flexio_tab_bar.dart';
import 'package:flutter/material.dart';

class FlexioPageView extends StatefulWidget {
  final List<Widget> pages;
  final List<String> tabs;

  const FlexioPageView({
    required this.pages,
    required this.tabs,
    super.key,
  });

  @override
  State<FlexioPageView> createState() => _FlexioPageViewState();
}

class _FlexioPageViewState extends State<FlexioPageView> {
  final _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlexioTabBarHomeTabBar(
          tabs: widget.tabs,
          controller: _pageController,
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            children: widget.pages,
          ),
        ),
      ],
    );
  }
}
