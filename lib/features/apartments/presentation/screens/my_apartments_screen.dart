import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class MyApartmentsScreen extends ConsumerWidget {
  const MyApartmentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apartments = ref.watch(apartmentsListProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Моя собственность'), centerTitle: true),
      body: apartments.when(
        data: (apartments) => ListView.builder(
          itemCount: apartments.length,
          itemBuilder: (context, index) {
            final apartment = apartments[index];
            return ListTile(
              title: Text(apartment.name),
              subtitle: Text(apartment.address ?? 'Адрес не указан'),
              onTap: () {},
            );
          },
        ),
        error: (error, stack) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
