import 'package:happy_money/data/database.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DatabaseProvider {
  late final AppDatabase _instance;
  static bool isInitialize = false;

  Future<void> initialize() async {
    if (isInitialize) return;

    _instance = AppDatabase();
    isInitialize = true;
  }
}
