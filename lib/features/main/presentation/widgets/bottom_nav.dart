import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: bottomNavItems);
  }
}

const List<BottomNavigationBarItem> bottomNavItems = [
  BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Главная'),
  BottomNavigationBarItem(icon: Icon(Icons.ssid_chart_rounded), label: 'Учет'),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings_rounded),
    label: 'Настройки',
  ),
];
