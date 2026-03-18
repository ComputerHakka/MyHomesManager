import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/local/database.dart';
import '../../data/repositories.dart';
import '../../domain/repositories.dart';

final apartmentsRepositoryProvider = Provider<ApartmentsRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ApartmentsRepositoryImpl(db);
});

// Провайдер данных (UI будет слушать именно его)
final apartmentsListProvider = StreamProvider<List<Apartment>>((ref) {
  final repository = ref.watch(apartmentsRepositoryProvider);
  return repository.watchAllApartments();
});
