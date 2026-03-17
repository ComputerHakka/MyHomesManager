import 'package:drift/drift.dart';

class Apartments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get address => text().nullable()();

  @override
  bool get isStrict => true;
}
