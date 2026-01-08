part of utils;

// extension PlacemarkExt on Placemark? {
//   String get address {
//     if (this == null || this?.country == '') return '';

//     final List<String> options = [
//       this?.street ?? this?.name ?? '',
//       this?.subAdministrativeArea ?? '',
//       this?.administrativeArea ?? '',
//       this?.country ?? '',
//     ];

//     final buffer = StringBuffer();

//     for (int index = 0; index < options.length; index++) {
//       final option = options[index].trim();
//       if (option.isEmpty) continue;

//       buffer.write(option);

//       if (index >= options.length - 1) continue;

//       buffer.write(', ');
//     }

//     return buffer.toString();
//   }
// }
