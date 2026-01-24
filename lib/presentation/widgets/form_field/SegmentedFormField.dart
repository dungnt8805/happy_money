import 'package:flutter/material.dart';

class SegmentedFormField<T> extends StatelessWidget {
  final String? title;
  final List<T> options;
  final T selectedValue;
  final Function(T) onChanged;
  final String Function(T) labelBuilder;

  final IconData Function(T)? iconBuilder;
  final String? Function(T?)? validator;

  const SegmentedFormField({
    super.key,
    this.title,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    required this.labelBuilder,
    this.iconBuilder,

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
            SizedBox(
              width: double.infinity,
              child: SegmentedButton<T>(
                segments: options.map((T option) {
                  return ButtonSegment<T>(
                    value: option,
                    label: Text(labelBuilder(option)),
                    icon: iconBuilder != null
                        ? Icon(iconBuilder!(option))
                        : null,
                  );
                }).toList(),
                selected: {field.value as T},
                onSelectionChanged: (Set<T> newSelection) {
                  final T selected = newSelection.first;
                  field.didChange(selected);
                  onChanged(selected);
                },
              ),
            ),
            // Hiển thị lỗi validate
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 12),
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
