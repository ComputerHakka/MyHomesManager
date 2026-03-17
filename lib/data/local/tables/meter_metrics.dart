import 'package:drift/drift.dart';
import 'package:my_homes_manager/data/local/tables/meters.dart';

@TableIndex(name: 'idx_metrics_meter', columns: {#meterId})
class MeterMetrics extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get meterId => integer().references(Meters, #id)();
  TextColumn get label => text()(); // 'Т1', 'Т2', 'Холодная', 'Горячая'

  @override
  bool get isStrict => true;
}
