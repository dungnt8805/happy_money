part of utils;

class HashTagTextInputFormatter extends TextInputFormatter {
  HashTagTextInputFormatter({this.regEx});

  final RegExp? regEx;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (regEx != null) {
      final bool availableText = regEx!.hasMatch(newValue.text);
      if (!availableText) {
        return oldValue;
      }
    }
    if (newValue.text.length < oldValue.text.length) return newValue;
    if (oldValue.text.isEmpty) {
      return newValue.copyWith(
        text: '#${newValue.text}',
        selection: TextSelection.collapsed(
          offset: newValue.text.length + 1,
        ),
      );
    }
    if (newValue.text.isEmpty) {
      return newValue;
    }
    if (!newValue.text.contains(RegExp(r'\s'))) {
      return newValue;
    }
    final slice = newValue.text.split(RegExp(r'\s'));
    if (slice.first.isNotEmpty && !slice.first.contains('#')) {
      slice[0] = '#${slice.first}';
    }
    if (slice.last.isNotEmpty && !slice.last.contains('#')) {
      slice[slice.length - 1] = '#${slice.last}';
    }
    final newText = slice.join(' ');
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
        offset: newText.length,
      ),
    );
  }
}
