import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassy_navbar/core/widgets/glassy_navbar.dart';
import 'package:glassy_navbar/views/home_view.dart';
import 'package:glassy_navbar/views/notifications_view.dart';
import 'package:glassy_navbar/views/profile_view.dart';
import 'package:glassy_navbar/views/search_view.dart';
import 'package:glassy_navbar/views/settings_view.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeView(),
    SearchView(),
    NotificationsView(),
    ProfileView(),
    SettingsView(),
  ];

  void _onNavItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<GlassmorphicNavBarItem> _navBarItems = [
    GlassmorphicNavBarItem(
      useCustomIcon: true,
      selectedIcon: SvgPicture.asset('assets/home_selected.svg'),
      unselectedIcon: SvgPicture.asset('assets/home_unselected.svg'),
      label: 'Home',
    ),
    const GlassmorphicNavBarItem(
      selectedIcon: Icon(Icons.search),
      unselectedIcon: Icon(Icons.search_outlined),
      label: 'Search',
    ),
    const GlassmorphicNavBarItem(
      selectedIcon: Icon(Icons.notifications),
      unselectedIcon: Icon(Icons.notifications_none),
      label: 'Notifications',
    ),
    const GlassmorphicNavBarItem(
      selectedIcon: Icon(Icons.person),
      unselectedIcon: Icon(Icons.person_outline),
      label: 'Profile',
    ),
    const GlassmorphicNavBarItem(
      selectedIcon: Icon(Icons.settings),
      unselectedIcon: Icon(Icons.settings_outlined),
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: GlassmorphicNavBar(
              currentIndex: _currentIndex,
              onItemTap: _onNavItemTap,
              items: _navBarItems,
              navBarHeight: 80,
              blurSigmaX: 4,
              blurSigmaY: 7,
              glassmorphicOpacity: 0,
              backgroundColor: const Color(0xFF00425C),
              selectedIconTheme: const IconThemeData(
                color: Colors.cyan,
                size: 26,
              ),
              unselectedIconTheme: const IconThemeData(
                color: Colors.white70,
                size: 23,
              ),
              selectedLabelStyle: const TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
              unselectedLabelStyle: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
