import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/router/router.dart';
import '../providers/providers.dart';

class NewApartmentScreen extends ConsumerStatefulWidget {
  const NewApartmentScreen({super.key});

  @override
  ConsumerState<NewApartmentScreen> createState() => _NewApartmentScreenState();
}

class _NewApartmentScreenState extends ConsumerState<NewApartmentScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(apartmentsControllerProvider);

    ref.listen<AsyncValue<void>>(apartmentsControllerProvider, (
      previous,
      next,
    ) {
      next.whenOrNull(
        error: (error, stack) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Ошибка: $error')));
        },
        data: (_) {
          // Если запись прошла успешно (предыдущее состояние было loading)
          if (previous?.isLoading == true) {
            ref.read(routerProvider).pop(); // Закрываем экран через GoRouter
          }
        },
      );
    });

    void onPressed() {
      if (_nameController.text.trim().isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Введите название помещения')));
      } else {
        ref
            .read(apartmentsControllerProvider.notifier)
            .addApartment(
              _nameController.text,
              _addressController.text.isEmpty ? null : _addressController.text,
            );
      }
    }

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
                controller: _nameController,
                enabled: !state.isLoading,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Адрес'),
                controller: _addressController,
                enabled: !state.isLoading,
              ),
              ElevatedButton(
                onPressed: state.isLoading ? null : onPressed,
                child: state.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Добавить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
