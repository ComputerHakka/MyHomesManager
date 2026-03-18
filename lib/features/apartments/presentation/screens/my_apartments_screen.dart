import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/constants/constants.dart';
import '../providers/providers.dart';

class MyApartmentsScreen extends ConsumerWidget {
  const MyApartmentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apartments = ref.watch(apartmentsListProvider);

    void onPressed() {
      ref.read(routerProvider).pushNamed(RouteNames.newApartment);
    }

    return Scaffold(
      appBar: AppBar(title: Text('Моя собственность'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(Icons.add),
      ),
      body: apartments.when(
        data: (list) => list.isEmpty
            ? const Center(child: Text('Добавьте новые помещения'))
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final apartment = list[index];
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
