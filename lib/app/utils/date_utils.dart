part of utils;

final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
final DateFormat dateFormatterMDY = DateFormat('MM/dd/yyyy');
final DateFormat dateFormatterMY = DateFormat('MM/yyyy');
final DateFormat dateFormatterDMY = DateFormat('dd/MM/yyyy');
final DateFormat monthFormatter = DateFormat('yyyy-MM');
final DateFormat hourFormatter = DateFormat('hh:mm a');
final DateFormat iso8601Formatter = DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ');
final DateFormat dateFormatterDEEEy = DateFormat('dd MMM y');
final DateFormat dayHourFormatter = DateFormat('MM/dd HH:mm:ss');
final DateFormat dayWeekFormatter = DateFormat('E, d MMM y');
final DateFormat dayOFWeekFormatter = DateFormat('EEE MMM d');
final DateFormat onlyDayOFWeekFormatter = DateFormat('EEE,d');
final DateFormat onlyMonthFormatter = DateFormat('MMM');
final DateFormat onlyYearFormatter = DateFormat('yyyy');

DateFormat dateFormatByLocale(Locale locale) {
  if (locale.languageCode == 'vi') {
    return dateFormatterDMY;
  } else {
    return dateFormatterMDY;
  }
}

String timeAgo({required DateTime date, BuildContext? context}) {
  return '';
  // final StringResources s = context.isNull
  //     ? R.string
  //     : StringResources.of(context!);
  // final dateNow = DateTime.now();
  // final diff = dateNow.difference(date);

  // if (diff.inDays >= 7) return date.format(DateFormat(s.df_MMdd));

  // if (diff.inDays >= 1) return s.daysAgo(diff.inDays);

  // if (diff.inHours >= 1) return s.hoursAgo(diff.inHours);

  // if (diff.inMinutes >= 1) return s.minutesAgo(diff.inMinutes);

  // if (diff.inSeconds > 1) return s.secondsAgo(diff.inSeconds);

  // return s.justNow;
}
