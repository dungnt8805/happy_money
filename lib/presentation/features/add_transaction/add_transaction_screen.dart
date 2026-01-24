import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:happy_money/app/themes/spacing.dart';
import 'package:happy_money/presentation/widgets/form_field/SegmentedFormField.dart';
import 'package:happy_money/presentation/widgets/form_field/ToggleFormField.dart';

@RoutePage()
class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Transaction'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SegmentedFormField(
                options: ['income', 'expense', 'debt_loan'],
                selectedValue: 'Income',
                onChanged: (select) {},
                labelBuilder: (option) => option,
              ),
              VSpace.medium(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Amount',
                    prefix: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text("VND"),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              // buildTextField('Amount'),
            ],
          ),
        ),
      ),
    );
  }
}
