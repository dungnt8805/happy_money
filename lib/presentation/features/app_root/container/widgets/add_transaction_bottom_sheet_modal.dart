import 'package:flutter/material.dart';
import 'package:happy_money/app/utils/utils.dart';
import 'package:happy_money/presentation/widgets/bottom_sheet/modal_bottom_sheet_base.dart';

Future<void> showAddTransactionBottomSheetModal(
  BuildContext context,
) async {
  return showModalBottomSheetBase(
    context,
    height: 90.h,
    builder: (context) =>  AddTransactionBottomSheetModal(),
  );
}

class AddTransactionBottomSheetModal extends StatelessWidget {
   AddTransactionBottomSheetModal({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red,);
  }
}