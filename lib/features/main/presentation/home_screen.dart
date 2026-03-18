import 'package:flutter/material.dart';
import 'package:my_homes_manager/features/main/presentation/widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главная пока что...')),
      body: const Center(child: Text('Home Screen')),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
