part of utils;

extension ObjectExt on Object? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;

  bool get isEmpty {
    if (this is String) return (this! as String).isEmpty;

    if (this is List) return (this! as List).isEmpty;

    return false;
  }

  bool get isNullOrEmpty => isNull || isEmpty;

  bool get isString => this is String;

  bool get isFile => this is File;
}
