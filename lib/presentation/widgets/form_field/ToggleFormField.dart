import 'package:flutter/material.dart';

class ToggleFormField<T> extends StatelessWidget {
  final List<T> options;
  final T selectedValue;
  final Function(T) onChanged;
  final String Function(T) labelBuilder;
  final String? title;
  final String? Function(T?)? validator;

  const ToggleFormField({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    required this.labelBuilder,
    this.title,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      initialValue: selectedValue,
      validator: validator,
      builder: (FormFieldState<T> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Text(title!, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
            ],
            ToggleButtons(
              borderRadius: BorderRadius.circular(8),
              isSelected: options
                  .map((option) => option == field.value)
                  .toList(),
              children: options
                  .map(
                    (option) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(labelBuilder(option)),
                    ),
                  )
                  .toList(),
              onPressed: (index) {
                final selected = options[index];
                field.didChange(selected);
                onChanged(selected);
              },
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  field.errorText!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
