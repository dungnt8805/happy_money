import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy_money/app/domain/entities/category_entity.dart';
import 'package:happy_money/app/themes/app_theme.dart';
import 'package:happy_money/presentation/features/category/widgets/category_item_list_tile.dart';

class CategoryItemCard extends StatelessWidget {
  final CategoryEntity category;
  const CategoryItemCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: context.appColors.onBackground2,
      child: Column(
        children: [
          CategoryItemListTile(
            id: category.id,
            name: category.name,
            iconCode: category.iconCode,
          ),
          for (var child in category.children) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(),
            ),
            CategoryItemListTile(
              id: child.id,
              name: child.name,
              iconCode: child.iconCode,
              isChild: true,
            ),
          ],
        ],
      ),
    );
  }
}
