part of 'category_bloc.dart';

@CopyWith()
class CategoryState extends Equatable {
  const CategoryState({required this.categories, this.prefectched = false});

  final List<CategoryEntity> categories;
  final bool prefectched;

  @override
  // TODO: implement props
  List<Object?> get props => [categories];
}
