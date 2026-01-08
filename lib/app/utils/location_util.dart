import 'dart:math';

double toRad(num distance) {
  return (distance * pi) / 180;
}

double calDistance(num lat1, num long1, num lat2, num long2) {
  const double R = 6371;
  final double dLat = toRad(lat2 - lat1);
  final double dLon = toRad(long2 - long1);
  final radLat1 = toRad(lat1);
  final radLat2 = toRad(lat2);
  final a = sin(dLat / 2) * sin(dLat / 2) +
      sin(dLon / 2) * sin(dLon / 2) * cos(radLat1) * cos(radLat2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));
  // final d = (((R * c) * 100) ~/ 1) / 100;
  return R * c;
}
