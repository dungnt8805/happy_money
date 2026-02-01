part of '../repository.dart';

extension CategoryModel2entityExt on Repository {
  @protected
  List<CategoryEntity> categoryModels2Entities(List<CategoryModel> models) {
    return models.map((model) => categoryModel2Entity(model)).toList();
  }

  @protected
  CategoryEntity categoryModel2Entity(CategoryModel model) {
    return CategoryEntity(
      id: model.id,
      name: model.name,
      code: model.code ?? '',
      iconCode: model.iconCode ?? 0,
      type: model.type,
      parentId: model.parentId,
      isUserDefined: model.isUserDefined,
      children: [],
    );
  }
}
