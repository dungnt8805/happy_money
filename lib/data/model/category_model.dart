import 'package:happy_money/data/database.dart' show TableCategoriesCompanion;

class CategoryModel {
  final int id;
  final String name;
  final String? code;
  final int? iconCode;
  final String type;
  final int? parentId;
  final bool isUserDefined;
  CategoryModel({
    required this.id,
    required this.name,
    required this.code,
    required this.iconCode,
    required this.type,
    required this.parentId,
    required this.isUserDefined,
  });

  factory CategoryModel.fromCompanion(TableCategoriesCompanion companion) {
    return CategoryModel(
      id: companion.id.value,
      name: companion.name.value,
      code: companion.code.value,
      iconCode: companion.iconCode.value,
      type: companion.type.value,
      parentId: companion.parentId.value,
      isUserDefined: companion.isUserDefined.value ?? false,
    );
  }
}