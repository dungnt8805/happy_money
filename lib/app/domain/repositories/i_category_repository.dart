import 'package:happy_money/app/domain/entities/category_entity.dart';

abstract interface class ICategoryRepository {
  Future<List<CategoryEntity>> fetchCategories();
}