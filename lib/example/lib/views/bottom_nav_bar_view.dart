import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassy_navbar/example/lib/views/home_view.dart';
import 'package:glassy_navbar/example/lib/views/notifications_view.dart';
import 'package:glassy_navbar/example/lib/views/profile_view.dart';
import 'package:glassy_navbar/example/lib/views/search_view.dart';
import 'package:glassy_navbar/example/lib/views/settings_view.dart';
import 'package:glassy_navbar/src/glassy_navbar.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int currentIndex = 0;

  final List<GlassmorphicNavBarItem> navBarItems = [
    GlassmorphicNavBarItem(
      customUnselectedIcon: SvgPicture.asset('assets/home_unselected.svg'),
      customSelectedIcon: SvgPicture.asset('assets/home_selected.svg'),
      label: 'Home',
    ),
    const GlassmorphicNavBarItem(icon: Icons.search, label: 'Search'),
    const GlassmorphicNavBarItem(
      icon: Icons.notifications,
      label: 'Notifications',
    ),
    const GlassmorphicNavBarItem(icon: Icons.person, label: 'Profile'),
    const GlassmorphicNavBarItem(icon: Icons.settings, label: 'Settings'),
  ];

  final List<Widget> screens = const [
    HomeView(),
    SearchView(),
    NotificationsView(),
    ProfileView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          screens[currentIndex],
          GlassmorphicNavBar(
            currentIndex: currentIndex,
            onItemTap: onNavItemTap,
            items: navBarItems,
            backgroundColor: const Color(0xFF00425C),
            blurSigma: 3,
            height: 70,
            opacity: 0.0,
            showLabels: true,
            selectedLabelStyle: const TextStyle(
              color: Colors.blue,
              fontSize: 12,
            ),
            unselectedLabelStyle: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
            selectedIconTheme: const IconThemeData(
              color: Colors.blue,
              size: 22,
            ),
            unselectedIconTheme: const IconThemeData(
              color: Colors.white70,
              size: 22,
            ),
            showTopBorder: true,
            topBorderStyle: const TopBorderStyle(
              color: Color.fromARGB(255, 0, 157, 255),
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  void onNavItemTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
