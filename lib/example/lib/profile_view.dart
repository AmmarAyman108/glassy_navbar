import 'package:flutter/material.dart';
import 'package:glassy_navbar/example/lib/colors_manager.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        title: const Text('Profile'),
        foregroundColor: ColorManager.kWhiteColor,
      ),
      body: const Center(
        child: Text(
          'User Profile Info Here',
          style: TextStyle(color: ColorManager.kWhiteColor, fontSize: 20),
        ),
      ),
    );
  }
}
