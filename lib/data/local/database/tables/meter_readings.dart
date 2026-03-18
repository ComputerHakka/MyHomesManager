import 'package:drift/drift.dart';
import 'package:my_homes_manager/data/local/database/tables/meter_metrics.dart';

@TableIndex(name: 'idx_readings_metric_date', columns: {#metricId, #date})
class MeterReadings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get metricId => integer().references(MeterMetrics, #id)();
  RealColumn get value => real()(); // Значение счетчика
  DateTimeColumn get date => dateTime().withDefault(currentDate)();

  @override
  bool get isStrict => true;
}
