import 'package:happy_money/data/database.dart';
import 'package:happy_money/data/model/category_model.dart';

class CategoryData {
  final AppDatabase db;

  CategoryData({required this.db});
  Future<List<CategoryModel>> getCategories() async {
    final allCategories = await db.select(db.tableCategories).get();
    final List<CategoryModel> categoryModels = allCategories
        .map((categoryRow) => CategoryModel(
              id: categoryRow.id,
              name: categoryRow.name,
              code: categoryRow.code,
              iconCode: categoryRow.iconCode,
              type: categoryRow.type,
              parentId: categoryRow.parentId,
              isUserDefined: categoryRow.isUserDefined ?? false,
            ))
        .toList();
    return categoryModels;
  }
}