import 'package:flexio_kvl/widget/bottom_navigation/bottom_navigation_item_widget.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabChanged;

  const BottomNavigation({
    required this.currentIndex,
    required this.onTabChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2,
              spreadRadius: 2,
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              Expanded(
                child: BottomNavigationItemWidget(
                  icon: Icons.home_rounded,
                  text: 'My FlexiO',
                  isSelected: currentIndex == 0,
                  onTap: () => onTabChanged(0),
                ),
              ),
              Expanded(
                child: BottomNavigationItemWidget(
                  icon: Icons.insert_chart_outlined_rounded,
                  text: 'History',
                  isSelected: currentIndex == 1,
                  onTap: () => onTabChanged(1),
                ),
              ),
            ],
          ),
        ),
      );
}
