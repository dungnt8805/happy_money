part of utils;

extension IntExt on int {
  /// Duration
  Duration get days => Duration(days: this);

  Duration get hours => Duration(hours: this);

  Duration get min => Duration(minutes: this);

  Duration get s => Duration(seconds: this);

  Duration get ms => Duration(milliseconds: this);

  Duration get us => Duration(microseconds: this);

  String numberCompact() => NumberFormat.compact().format(this);
}
