import 'package:flutter/material.dart';
import 'package:glassy_navbar/example/lib/colors_manager.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        title: const Text('Notifications'),
        foregroundColor: ColorManager.kWhiteColor,
      ),
      body: const Center(
        child: Text(
          'You have no new notifications.',
          style: TextStyle(color: ColorManager.kWhiteColor, fontSize: 20),
        ),
      ),
    );
  }
}
