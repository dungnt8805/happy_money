import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy_money/app/domain/entities/category_entity.dart';
import 'package:happy_money/app/themes/app_theme.dart';

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

                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: context.appColors.onBackground2,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) => ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.appColors.background,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  IconData(
                                    state[index].iconCode != null
                                        ? state[index].iconCode!
                                        : 0x00000000,
                                    fontFamily: 'MaterialIcons',
                                    fontFamilyFallback:
                                        [FontAwesomeIcons.faceAngry.fontFamily.toString()],
                                  ),
                                  color: AppPalette.blue,
                                ),
                              ),
                            ),
                            title: Text(
                              state[index].name,
                              style: TextStyle(
                                color: context.appColors.background2,
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          separatorBuilder: (_, _) => const Padding(
                            padding: EdgeInsets.only(left: 60),
                            child: Divider(),
                          ),
                          itemCount: state.length,
                        ),
                      ),
                      // ExpansionTile(title: Text("Food & Beverage")),
                    ],
                  );
                },
              ),
        ),
      ),
    );
  }
}
