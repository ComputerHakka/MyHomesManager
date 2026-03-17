import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Meters, Apartments, MeterMetrics, MeterReadings, Payments],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'meters_db',
      native: const DriftNativeOptions(
        // supportDirectory лучше подходит для БД, которую не нужно
        // бэкапить в iCloud/Google Drive автоматически
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}

// Включение внешних ключей
// return NativeDatabase.createInBackground(file, logStatements: true, setup: (db) {
//   db.execute('PRAGMA foreign_keys = ON'); // Обязательно для работы references
// });
