import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String name;
  final String code;
  final int? iconCode;
  final String type;
  final int? parentId;
  final bool isUserDefined;
  final List<CategoryEntity> children;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.iconCode,
    required this.type,
    required this.parentId,
    required this.isUserDefined,
    required this.children,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    code,
    iconCode,
    type,
    parentId,
    isUserDefined,
    children,
  ];
}
