import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy_money/app/domain/entities/category_entity.dart';
import 'package:happy_money/app/themes/app_theme.dart';
import 'package:happy_money/presentation/features/category/widgets/category_item_card.dart';

import 'controllers/category_bloc.dart';

@RoutePage()
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Categories")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              BlocSelector<CategoryBloc, CategoryState, List<CategoryEntity>>(
                selector: (state) => state.categories,
                builder: (context, state) {
                  return Column(
                    children: [
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.add_circle_outline_sharp),
                          title: Text("Add category"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) => CategoryItemCard(
                          category: state[index],
                        ),
                        itemCount: state.length,
                      ),
                    ],
                  );
                },
              ),
        ),
      ),
    );
  }
}
