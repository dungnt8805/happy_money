import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:happy_money/app/app.dart';
import 'package:happy_money/app/themes/app_theme.dart';

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
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: context.appColors.onBackground2,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, _) => ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.appColors.background,

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.wine_bar_rounded, color: AppPalette.blue,),
                      ),
                    ),
                    title: Text(
                      "Food & Beverage",
                      style: TextStyle(color: context.appColors.background2),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  separatorBuilder: (_, _) => const Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Divider(),
                  ),
                  itemCount: 4,
                ),
              ),
              // ExpansionTile(title: Text("Food & Beverage")),
            ],
          ),
        ),
      ),
    );
  }
}
