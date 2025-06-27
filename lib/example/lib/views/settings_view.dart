import 'package:flutter/material.dart';
import 'package:glassy_navbar/example/lib/theme/colors_manager.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        title: const Text('Settings'),
        foregroundColor: ColorManager.kWhiteColor,
      ),
      body: const Center(
        child: Text(
          'Adjust your preferences',
          style: TextStyle(color: ColorManager.kWhiteColor, fontSize: 20),
        ),
      ),
    );
  }
}
