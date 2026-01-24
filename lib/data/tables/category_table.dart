import 'package:drift/drift.dart';

class TableCategories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get code => text().nullable()();

  IntColumn get iconCode => integer().nullable()();

  TextColumn get type => text()();

  IntColumn get parentId => integer().nullable()();
}
