part of utils;

void showKeyBoard(BuildContext context, [FocusNode? focusNode]) {
  if (focusNode != null) {
    focusNode.requestFocus();
  }

  FocusScope.of(context).requestFocus();
}

void hideKeyBoard(BuildContext context, [FocusNode? focusNode]) {
  if (focusNode != null) {
    focusNode.unfocus();
  }

  FocusScope.of(context).unfocus();
}
