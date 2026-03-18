import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers.dart';

// 1. Используем правильный тип провайдера
final apartmentsControllerProvider =
    AsyncNotifierProvider.autoDispose<ApartmentsController, void>(() {
      return ApartmentsController();
    });

// 2. Наследуемся от AutoDisposeAsyncNotifier
class ApartmentsController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // Просто возвращаем null или начальное значение.
    // Это аналог super(initialValue) из StateNotifier.
    return null;
  }

  Future<void> addApartment(String name, String? address) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final repo = ref.read(apartmentsRepositoryProvider);
      // Используем Value(address) для обработки nullable, как мы выяснили раньше
      await repo.addApartment(name, address);
    });
  }
}
