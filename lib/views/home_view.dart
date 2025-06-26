import 'package:flutter/material.dart';
import 'package:glassy_navbar/core/theme/colors_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        title: const Text('Home'),
        foregroundColor: ColorManager.kWhiteColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Back 👋',
              style: TextStyle(
                color: ColorManager.kWhiteColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorManager.darkBlueAskContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Icon(Icons.star, color: ColorManager.yellowColor, size: 32),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'You’ve completed 5 tasks today!',
                      style: TextStyle(
                        color: ColorManager.kWhiteColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Quick Actions',
              style: TextStyle(
                color: ColorManager.kWhiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _quickActionItem(
                  Icons.check_circle,
                  "Tasks",
                  ColorManager.greenColor,
                ),
                _quickActionItem(
                  Icons.chat_bubble,
                  "Messages",
                  ColorManager.blueColor,
                ),
                _quickActionItem(
                  Icons.settings,
                  "Settings",
                  ColorManager.yellowColor,
                ),
                _quickActionItem(
                  Icons.person,
                  "Profile",
                  ColorManager.redColor,
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Latest News',
              style: TextStyle(
                color: ColorManager.kWhiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            _newsCard(
              'New features added',
              'Check out the new dark mode update.',
            ),
            _newsCard(
              'Security tips',
              'Stay safe with our top 5 security guidelines.',
            ),
            _newsCard('Community', 'Join our Discord and connect with others!'),
            _newsCard(
              'notifications tips',
              'Check out the new dark mode update!',
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _quickActionItem(IconData icon, String label, Color color) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorManager.darkBlue,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.6), width: 1.2),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: ColorManager.kWhiteColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _newsCard(String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorManager.darkBlueAskContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: ColorManager.kWhiteColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(
              color: ColorManager.whiteColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
