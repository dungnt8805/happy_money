import 'package:happy_money/app/domain/entities/category_entity.dart';
import 'package:happy_money/app/domain/repositories/i_category_repository.dart';
import 'package:happy_money/app/helpers/injection.dart';
import 'package:happy_money/data/database_provider.dart';
import 'package:happy_money/data/repositories/repository.dart';
import 'package:happy_money/data/sources/local/category_data.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ICategoryRepository)
class CategoryRepository extends Repository implements ICategoryRepository {
  final CategoryData categoryData = CategoryData(
    db: getIt<DatabaseProvider>().instance,
  );

  @override
  Future<List<CategoryEntity>> fetchCategories() async {
    final categoryModels = await categoryData.getCategories();
    final categoryEntities = categoryModels2Entities(categoryModels);
    // Nest child categories into their parent's `children` property

    final _roots = categoryEntities.where(
      (category) => category.parentId == null,
    );
    final List<CategoryEntity> roots = [];
    for (final root in _roots) {
      final temp = categoryEntities
          .where((category) => category.parentId == root.id)
          .toList();
      final rootCategory = CategoryEntity(
        id: root.id,
        name: root.name,
        code: root.code,
        iconCode: root.iconCode,
        type: root.type,
        parentId: null,
        isUserDefined: root.isUserDefined,
        children: temp,
      );
      roots.add(rootCategory);
    }
    return roots;
  }
}
