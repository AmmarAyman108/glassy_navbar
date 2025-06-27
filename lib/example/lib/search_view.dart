import 'package:flutter/material.dart';
import 'package:glassy_navbar/example/lib/colors_manager.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        title: const Text('Search'),
        foregroundColor: ColorManager.kWhiteColor,
      ),
      body: const Center(
        child: Text(
          'Find what you\'re looking for!',
          style: TextStyle(color: ColorManager.kWhiteColor, fontSize: 20),
        ),
      ),
    );
  }
}
