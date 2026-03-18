import 'package:drift/drift.dart';
import 'package:my_homes_manager/data/local/database/tables/apartments.dart';

@TableIndex(name: 'idx_meters_apartment', columns: {#apartmentId})
class Meters extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get apartmentId => integer().references(Apartments, #id)();
  TextColumn get type => text()(); // 'water', 'electricity', 'gas'
  TextColumn get location =>
      text().clientDefault(() => 'Общий')(); // 'Ванная', 'Кухня', 'Общий'

  @override
  bool get isStrict => true;
}
