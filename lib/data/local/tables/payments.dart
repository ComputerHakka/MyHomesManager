import 'package:drift/drift.dart';
import 'package:my_homes_manager/data/local/tables/meters.dart';

@TableIndex(name: 'idx_payments_meter', columns: {#meterId})
class Payments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get meterId => integer().references(Meters, #id)();
  RealColumn get amount => real()(); // Сумма в рублях/валюте
  DateTimeColumn get period => dateTime()(); // Месяц, за который платим
  BoolColumn get isPaid => boolean().withDefault(const Constant(false))();

  @override
  bool get isStrict => true;
}
