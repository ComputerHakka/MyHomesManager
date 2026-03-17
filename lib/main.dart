import 'package:flutter/material.dart';

import 'features/home/f_home.dart';

void main() {
  runApp(const MyHomesManager());
}

class MyHomesManager extends StatelessWidget {
  const MyHomesManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MHM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
    );
  }
}
