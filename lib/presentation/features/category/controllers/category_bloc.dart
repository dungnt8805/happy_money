import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import 'package:happy_money/app/domain/entities/category_entity.dart';
import 'package:happy_money/app/domain/repositories/i_category_repository.dart';
import 'package:happy_money/app/helpers/injection.dart';

part 'category_event.dart';

part 'category_state.dart';

part 'category_bloc.g.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository categoryRepository = getIt<ICategoryRepository>();

  CategoryBloc() : super(CategoryState(categories: [])) {
    on<LoadCategoryEvent>(_onFetchCategories);
    on<PreloadCategoryEvent>(_onPreloadCategories);
  }

  Future<void> _onFetchCategories(
    LoadCategoryEvent evt,
    Emitter<CategoryState> emitter,
  ) async {
    final categories = await categoryRepository.fetchCategories();
    emitter(state.copyWith(categories: categories));
  }

  Future<void> _onPreloadCategories(
    PreloadCategoryEvent evt,
    Emitter<CategoryState> emitter,
  ) async {
    if (!state.prefectched) {
      await _onFetchCategories(LoadCategoryEvent(), emitter);
    }
  }
}
