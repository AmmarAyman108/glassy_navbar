import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassy_navbar/glassy_navbar.dart';
import 'package:glassy_navbar/home_view.dart';
import 'package:glassy_navbar/notifications_view.dart';
import 'package:glassy_navbar/profile_view.dart';
import 'package:glassy_navbar/search_view.dart';
import 'package:glassy_navbar/settings_view.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int currentIndex = 0;

  final List<GlassyNavBarItem> navBarItems = [
    GlassyNavBarItem(
      customUnselectedIcon: SvgPicture.asset('assets/home_unselected.svg'),
      customSelectedIcon: SvgPicture.asset('assets/home_selected.svg'),
      label: 'Home',
    ),
    const GlassyNavBarItem(icon: Icons.search, label: 'Search'),
    const GlassyNavBarItem(icon: Icons.notifications, label: 'Notifications'),
    const GlassyNavBarItem(icon: Icons.person, label: 'Profile'),
    const GlassyNavBarItem(icon: Icons.settings, label: 'Settings'),
  ];

  final List<Widget> screens = [
    const HomeView(),
    const SearchView(),
    const NotificationsView(),
    const ProfileView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          screens[currentIndex],
          GlassyNavBar(
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
