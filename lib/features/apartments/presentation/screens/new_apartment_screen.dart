import 'package:flutter/material.dart';

class NewApartmentScreen extends StatelessWidget {
  const NewApartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Новое помещение')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Column(
            spacing: 15,
            children: [
              Expanded(child: SizedBox()),
              TextField(
                decoration: const InputDecoration(labelText: 'Название'),
              ),
              TextField(decoration: const InputDecoration(labelText: 'Адрес')),
              ElevatedButton(onPressed: () {}, child: const Text('Добавить')),
            ],
          ),
        ),
      ),
    );
  }
}
