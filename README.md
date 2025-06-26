# 🌫️ glassy_navbar

A beautiful and customizable glassmorphic bottom navigation bar for Flutter apps with blur and transparency effects.

---

## 📸 Preview

![preview](https://your_image_link_if_any.png)

---

## ✨ Features

✅ Fully customizable (icons, labels, colors, blur, opacity)  
✅ Supports custom SVG or standard Flutter icons  
✅ Optional top border  
✅ Works with `Stack` layout for proper glass effect  
✅ Compatible with `flutter_svg`

---

## 🚀 Installation

Add to `pubspec.yaml`:

```yaml
dependencies:
  glassy_navbar: ^0.0.1
```

---

## ⚙️ Usage

> **Important:** Make sure to wrap the `GlassyNavBar` inside a `Stack` and align it to the bottom, **not** directly in `bottomNavigationBar`, to ensure the blur and layering works correctly.

### ✅ Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassy_navbar/glassy_navbar.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBarExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BottomNavBarExample extends StatefulWidget {
  @override
  State<BottomNavBarExample> createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
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
    GlassmorphicNavBarItem(
      selectedIcon: Icon(Icons.search),
      unselectedIcon: Icon(Icons.search_outlined),
      label: 'Search',
    ),
    GlassmorphicNavBarItem(
      selectedIcon: Icon(Icons.notifications),
      unselectedIcon: Icon(Icons.notifications_none),
      label: 'Notifications',
    ),
    GlassmorphicNavBarItem(
      selectedIcon: Icon(Icons.person),
      unselectedIcon: Icon(Icons.person_outline),
      label: 'Profile',
    ),
    GlassmorphicNavBarItem(
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
              glassmorphicOpacity: 0.3,
              backgroundColor: Color(0xFF00425C),
              selectedIconTheme: IconThemeData(
                color: Colors.cyan,
                size: 26,
              ),
              unselectedIconTheme: IconThemeData(
                color: Colors.white70,
                size: 23,
              ),
              selectedLabelStyle: TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
              unselectedLabelStyle: TextStyle(
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
```

---

## 🎨 Parameters

| Parameter             | Description                             |
|----------------------|-----------------------------------------|
| `currentIndex`        | Index of the selected item              |
| `onItemTap`           | Callback for item tap                   |
| `items`               | List of `GlassmorphicNavBarItem`       |
| `blurSigmaX/Y`        | Blur intensity                         |
| `backgroundColor`     | Base color for the navbar              |
| `glassmorphicOpacity` | Opacity of the background (default `0.3`) |
| `selectedIconTheme`   | Icon style for selected item           |
| `unselectedIconTheme` | Icon style for unselected items        |
| `showLabels`          | Whether to show labels                 |

---

## 📦 Assets

If you're using SVG icons, don't forget to declare them in your `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/home_selected.svg
    - assets/home_unselected.svg
```

---

## 💡 Tip

Use `glassmorphicOpacity = 0.0` for full transparency, or increase it for more solid background.

---

## 📃 License

MIT License © 2025 — [Ammar Ayman](https://github.com/AmmarAyman108)
