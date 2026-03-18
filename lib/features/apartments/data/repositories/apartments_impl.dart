import 'package:drift/drift.dart';

import '../../../../data/local/database/database.dart';
import '../../domain/repositories/repositories.dart';

class ApartmentsRepositoryImpl implements ApartmentsRepository {
  final AppDatabase _db;
  ApartmentsRepositoryImpl(this._db);

  @override
  Future<void> addApartment(String name, String? address) {
    return _db
        .into(_db.apartments)
        .insert(
          ApartmentsCompanion.insert(name: name, address: Value(address)),
        );
  }

  @override
  Stream<List<Apartment>> watchAllApartments() =>
      _db.select(_db.apartments).watch();
}
