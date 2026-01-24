import 'package:drift/drift.dart';

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get icon => text().nullable()();

  TextColumn get type => text()();

  IntColumn get parentId => integer().nullable()();
}
