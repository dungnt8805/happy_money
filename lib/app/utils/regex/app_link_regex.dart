part of utils;

RegExp _mediaIdRegex = RegExp('/media/([a-f0-9]{24})');
RegExp _usernameRegex = RegExp('/user/([A-Za-z0-9_]{4,25})');

String findMediaIdInAppLink(Uri uri) {
  final Match? match = _mediaIdRegex.firstMatch(uri.path);

  if (match == null) return '';

  final String? mediaId = match.group(1);

  return mediaId ?? '';
}

String findUsernameInAppLink(Uri uri) {
  final Match? match = _usernameRegex.firstMatch(uri.toString());

  if (match == null) return '';

  final String? username = match.group(1);

  return username ?? '';
}
