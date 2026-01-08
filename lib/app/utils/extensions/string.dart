// ignore_for_file: unnecessary_brace_in_string_interps, noop_primitive_operations

part of utils;

// String checkRegexPass(
//   BuildContext context, {
//   required String value,
//   bool oldPass = false,
// }) {
//   if (!oldPass) {
//     if (value.length < 8) {
//       return context.l10n.passwordLengthMin;
//     }
//     if (!value.contains(RegExp('^(.*?[A-Z])'))) {
//       return context.l10n.passwordUpperMin;
//     }
//     if (!value.contains(RegExp(r"^(.*?[$&+,\\/:;=?@#|'<>.^*()_%!-])"))) {
//       return context.l10n.passwordSpecMin;
//     }
//   }
//   if (RegExp(r"(.*?[^a-zA-Z0-9$&+,\\/:;=?@#|'`<>.^*()_%!-])").hasMatch(value)) {
//     return context.l10n.invalidPassword;
//   }
//   return '';
// }

bool checkRegexUsername(String value) {
  return !RegExp(r'^[A-Za-z0-9_]{4,25}$').hasMatch(value);
}

// String keyFileToS3URL(String? key) {
//   if (key != null && key.contains('http')) return key;
//   if (key == null || key.isEmpty) return '';

//   return '${BaseUrlConfig().baseS3Url}/$key';
// }

// String keyMusicToS3URL(String? key) {
//   if (key != null && key.contains('http')) return key;
//   if (key == null || key.isEmpty) return '';

//   return '${BaseUrlConfig().baseS3Url}/music-source/$key';
// }

// String idMediaToThumbnailS3URL(String id) {
//   return '${BaseUrlConfig().baseS3Url}/images/$id.jpg';
// }

extension StringExt on String? {
  String toCapitalize() {
    if (this?.isNotEmpty ?? false) {
      if (this?.length == 1) {
        return this!.toUpperCase();
      }
      return this![0].toUpperCase() + this!.substring(1);
    }

    return '';
  }

  String truncateWithEllipsis(int cutoff) {
    if (this == null || this!.isEmpty) return '';

    if (this!.length <= cutoff) return this!;

    return '${this!.substring(0, cutoff)}...';
  }

  DateTime toDateTime() {
    if (this?.isNotEmpty ?? false) {
      return DateTime.tryParse(this!) ?? DateTime.now();
    }
    return DateTime.now();
  }

  String getHashTagInString() {
    if (this == null || this!.isEmpty) return '';
    return this!.splitMapJoin(
      hashTagRegExp,
      onMatch: (m) => '${m[0]}',
      onNonMatch: (m) => '',
    );
  }

  // String getImageThumbSize(int size) {
  //   if (this == null || this!.isEmpty) return '';
  //   final pattern = '${BaseUrlConfig().baseS3Url}/images/';
  //   if (!this!.contains(pattern)) {
  //     return this!;
  //   }
  //   return this!.replaceFirst(pattern, '${pattern}${size.toString()}/');
  // }

  double getHeightText(double textSize, BuildContext context, int maxLines) {
    final textSpan = TextSpan(
      text: this,
      style: TextStyle(
        fontSize: textSize,
      ),
    );
    final tp = TextPainter(
      text: textSpan,
      textDirection: Directionality.of(context),
      maxLines: maxLines,
    )..layout(maxWidth: 100.w - 20 * 2);
    return tp.height;
  }

  Size getSizeText(
    double textSize,
    BuildContext context,
  ) {
    final Size sizeFull = (TextPainter(
      text: TextSpan(
        text: this,
        style: TextStyle(
          fontSize: textSize,
        ),
      ),
      textDirection: Directionality.of(context),
    )..layout(maxWidth: 100.w - 20 * 2)).size;
    return sizeFull;
  }
}

//^                                            Match the beginning of the string
// (?=.*[0-9])                                  Require that at least one digit appear anywhere in the string
// (?=.*[a-z])                                  Require that at least one lowercase letter appear anywhere in the string
// (?=.*[A-Z])                                  Require that at least one uppercase letter appear anywhere in the string
// [*.!@$%^&(){}[\]:;<>,.?/~_+\-=|]+   Require that at least one special character appear anywhere in the string
// .{8,32}                                      The password must be at least 8 characters long, but no more than 32
// [ァ-ン]                                          Katakana full_width
// [ぁ-ん]                                          Hirgana full_width
// [ｧ-ﾝﾞﾟ]                                           Kana half_width
// [０-９]                                      full_width number
// [Ａ-ｚ]                                    full_width character
// [ぁ-んァ-ン]                                   matching Hirgana or Katakana
// [一-龥]                                      matching Kanji
// $                                            Match the end of the string.
// àáạảãâầấậẩẫăằắặẳẵđèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹ                 Match tieng viet
RegExp regexOnlyEnglishAndNumber() {
  //fullwidth/halfwidth(E, number)
  return RegExp(
    r'^[Ａ-ｚa-zA-Z0-9０-９#àáạảãâầấậẩẫăằắặẳẵđèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹ ]*$',
    unicode: true,
  );
}
