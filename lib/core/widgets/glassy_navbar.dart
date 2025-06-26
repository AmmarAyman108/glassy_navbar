import 'dart:ui';
import 'package:flutter/material.dart';

class GlassmorphicNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTap;
  final List<GlassmorphicNavBarItem> items;

  final double blurSigmaX;
  final double blurSigmaY;
  final Color backgroundColor;
  final double navBarHeight;
  final double glassmorphicOpacity;

  final bool showLabels;

  final TextStyle selectedLabelStyle;
  final TextStyle unselectedLabelStyle;

  final IconThemeData selectedIconTheme;
  final IconThemeData unselectedIconTheme;

  final bool showTopBorder;
  final Color topBorderColor;
  final double topBorderHeight;

  const GlassmorphicNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTap,
    required this.items,
    this.blurSigmaX = 3,
    this.blurSigmaY = 3,
    this.backgroundColor = const Color(0xFF30579A),
    this.navBarHeight = 70.0,
    this.glassmorphicOpacity = 0.3,
    this.showLabels = true,
    this.selectedLabelStyle = const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Color(0xFF00A6E8),
    ),
    this.unselectedLabelStyle = const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Color(0xFFF1FBFF),
    ),
    this.selectedIconTheme = const IconThemeData(
      color: Color(0xFF00A6E8),
      size: 24.0,
    ),
    this.unselectedIconTheme = const IconThemeData(
      color: Color(0xFFF1FBFF),
      size: 24.0,
    ),
    this.showTopBorder = true,
    this.topBorderColor = const Color(0xFF00A6E8),
    this.topBorderHeight = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: navBarHeight + (showTopBorder ? topBorderHeight : 0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (showTopBorder)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: topBorderHeight,
              child: Container(height: topBorderHeight, color: topBorderColor),
            ),
          Positioned(
            top: showTopBorder ? topBorderHeight : 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: blurSigmaX,
                  sigmaY: blurSigmaY,
                ),
                child: Container(
                  height: navBarHeight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Color.fromRGBO(
                    backgroundColor.red,
                    backgroundColor.green,
                    backgroundColor.blue,
                    glassmorphicOpacity,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(items.length, (index) {
                      final bool isSelected = index == currentIndex;
                      final GlassmorphicNavBarItem item = items[index];
                      final IconThemeData iconTheme =
                          isSelected ? selectedIconTheme : unselectedIconTheme;
                      final TextStyle labelStyle =
                          isSelected
                              ? selectedLabelStyle
                              : unselectedLabelStyle;

                      return GestureDetector(
                        onTap: () => onItemTap(index),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            item.useCustomIcon
                                ? (isSelected
                                    ? item.selectedIcon
                                    : item.unselectedIcon)
                                : IconTheme(
                                  data: iconTheme,
                                  child:
                                      isSelected
                                          ? item.selectedIcon
                                          : item.unselectedIcon,
                                ),
                            const SizedBox(height: 4),
                            if (showLabels) Text(item.label, style: labelStyle),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GlassmorphicNavBarItem {
  final Widget selectedIcon;
  final Widget unselectedIcon;
  final String label;

  final bool useCustomIcon;

  const GlassmorphicNavBarItem({
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.label,
    this.useCustomIcon = false,
  });
}
