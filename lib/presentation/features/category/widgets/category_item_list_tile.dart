import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy_money/app/themes/app_theme.dart';

class CategoryItemListTile extends StatelessWidget {
  const CategoryItemListTile({
    super.key,
    required this.id,
    required this.name,
    this.iconCode,
    this.isChild = false,
  });
  final int id;
  final String name;
  final int? iconCode;
  final bool isChild;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.appColors.background,
        ),
        child: Icon(
          IconData(
            iconCode != null ? iconCode! : 0x00000000,
            fontFamily: 'MaterialIcons',
            fontFamilyFallback: [
              FontAwesomeIcons.faceAngry.fontFamily.toString(),
            ],
          ),
          size: isChild ? 16 : 20,
          color: AppPalette.blue,
        ),
      ),
      title: Text(name, style: TextStyle(color: context.appColors.background2)),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
