import 'dart:ui';
import 'package:flutter/material.dart';

class GlassyNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTap;
  final List<GlassyNavBarItem> items;
  final double blurSigma;
  final Color backgroundColor;
  final double height;
  final double opacity;
  final bool showLabels;
  final TextStyle selectedLabelStyle;
  final TextStyle unselectedLabelStyle;
  final IconThemeData selectedIconTheme;
  final IconThemeData unselectedIconTheme;
  final bool showTopBorder;
  final TopBorderStyle topBorderStyle;

  const GlassyNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTap,
    required this.items,
    this.blurSigma = 4,
    this.backgroundColor = const Color.fromARGB(255, 0, 95, 116),
    this.height = 70.0,
    this.opacity = 0.0,
    this.showLabels = true,
    TextStyle? selectedLabelStyle,
    TextStyle? unselectedLabelStyle,
    IconThemeData? selectedIconTheme,
    IconThemeData? unselectedIconTheme,
    this.showTopBorder = true,
    this.topBorderStyle = const TopBorderStyle(),
  }) : selectedLabelStyle =
           selectedLabelStyle ??
           const TextStyle(
             fontSize: 12.0,
             fontWeight: FontWeight.w600,
             color: Colors.blue,
           ),
       unselectedLabelStyle =
           unselectedLabelStyle ??
           const TextStyle(
             fontSize: 12.0,
             fontWeight: FontWeight.w600,
             color: Color.fromARGB(255, 168, 168, 168),
           ),
       selectedIconTheme =
           selectedIconTheme ??
           const IconThemeData(color: Colors.blue, size: 24.0),
       unselectedIconTheme =
           unselectedIconTheme ??
           const IconThemeData(
             color: Color.fromARGB(255, 168, 168, 168),
             size: 24.0,
           ),
       assert(items.length >= 2, 'At least two items are required');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Colors.transparent,
          child: SizedBox(
            height: height + (showTopBorder ? topBorderStyle.height : 0.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                if (showTopBorder)
                  TopBorder(
                    height: topBorderStyle.height,
                    color: topBorderStyle.color,
                  ),
                Positioned.fill(
                  top: showTopBorder ? topBorderStyle.height : 0.0,
                  child: GlassContent(
                    blurSigma: blurSigma,
                    backgroundColor: backgroundColor,
                    height: height,
                    opacity: opacity,
                    items: items,
                    currentIndex: currentIndex,
                    showLabels: showLabels,
                    selectedLabelStyle: selectedLabelStyle,
                    unselectedLabelStyle: unselectedLabelStyle,
                    selectedIconTheme: selectedIconTheme,
                    unselectedIconTheme: unselectedIconTheme,
                    onItemTap: onItemTap,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopBorder extends StatelessWidget {
  final double height;
  final Color color;

  const TopBorder({super.key, required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      height: height,
      child: DecoratedBox(decoration: BoxDecoration(color: color)),
    );
  }
}

class GlassContent extends StatelessWidget {
  final double blurSigma;
  final Color backgroundColor;
  final double height;
  final double opacity;
  final List<GlassyNavBarItem> items;
  final int currentIndex;
  final bool showLabels;
  final TextStyle selectedLabelStyle;
  final TextStyle unselectedLabelStyle;
  final IconThemeData selectedIconTheme;
  final IconThemeData unselectedIconTheme;
  final ValueChanged<int> onItemTap;

  const GlassContent({
    super.key,
    required this.blurSigma,
    required this.backgroundColor,
    required this.height,
    required this.opacity,
    required this.items,
    required this.currentIndex,
    required this.showLabels,
    required this.selectedLabelStyle,
    required this.unselectedLabelStyle,
    required this.selectedIconTheme,
    required this.unselectedIconTheme,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurSigma,
          sigmaY: blurSigma,
          tileMode: TileMode.decal,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor.withValues(alpha: opacity),
          ),
          child: SizedBox(
            height: height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  items.length,
                  (index) => NavItem(
                    item: items[index],
                    isSelected: index == currentIndex,
                    showLabels: showLabels,
                    selectedLabelStyle: selectedLabelStyle,
                    unselectedLabelStyle: unselectedLabelStyle,
                    selectedIconTheme: selectedIconTheme,
                    unselectedIconTheme: unselectedIconTheme,
                    onTap: () => onItemTap(index),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final GlassyNavBarItem item;
  final bool isSelected;
  final bool showLabels;
  final TextStyle selectedLabelStyle;
  final TextStyle unselectedLabelStyle;
  final IconThemeData selectedIconTheme;
  final IconThemeData unselectedIconTheme;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.showLabels,
    required this.selectedLabelStyle,
    required this.unselectedLabelStyle,
    required this.selectedIconTheme,
    required this.unselectedIconTheme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconWidget = _buildIconWidget();

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 24, height: 24, child: iconWidget),
            if (showLabels) ...[
              const SizedBox(height: 4.0),
              Text(
                item.label,
                style: isSelected ? selectedLabelStyle : unselectedLabelStyle,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildIconWidget() {
    if (item.customUnselectedIcon != null && item.customSelectedIcon != null) {
      return isSelected ? item.customSelectedIcon! : item.customUnselectedIcon!;
    }
    return IconTheme(
      data: isSelected ? selectedIconTheme : unselectedIconTheme,
      child: Icon(item.icon),
    );
  }
}

class GlassyNavBarItem {
  final IconData? icon;
  final String label;
  final Widget? customUnselectedIcon;
  final Widget? customSelectedIcon;

  const GlassyNavBarItem({
    this.icon,
    required this.label,
    this.customUnselectedIcon,
    this.customSelectedIcon,
  }) : assert(
         customUnselectedIcon == null || customSelectedIcon != null,
         '\\n\\ncustomSelectedIcon must also be provided\\n',
       ),
       assert(
         customSelectedIcon == null || customUnselectedIcon != null,
         '\\n\\ncustomUnselectedIcon must also be provided\\n',
       ),
       assert(
         (icon != null &&
                 customUnselectedIcon == null &&
                 customSelectedIcon == null) ||
             (icon == null &&
                 customUnselectedIcon != null &&
                 customSelectedIcon != null),
         '\\nError: Must provide either:\\n'
         '1. Just an icon (for Material icons) OR\\n'
         '2. Both customUnselectedIcon AND customSelectedIcon (for custom icons)\\n'
         'Do not mix both approaches.\\n',
       );
}

class TopBorderStyle {
  final Color color;
  final double height;

  const TopBorderStyle({
    this.color = const Color(0xFF00A6E8),
    this.height = 1.0,
  });
}
