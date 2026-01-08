part of app_theme;

abstract class AppPalette {
  static const Color primary = Color(0xFF5C59E8);
  static const Color primaryO60 = Color(0x995C59E8);
  static const Color primaryAccent = Color(
    0xFFEBEBFF,
  ); // Tông xanh tím rất nhạt

  // Secondary: Màu xanh lá cây (tượng trưng cho Income/Profit)
  static const Color secondary = Color(0xFF00D09C);
  static const Color secondaryO60 = Color(0x9900D09C);
  static const Color transparent = Colors.transparent;

  // Background Light Mode
  static Color bgrLight = const _WhiteColors().shade900; // Trắng thuần
  static Color bgrLight2 = const _WhiteColors().shade800; // Xám trắng nhạt
  static Color onBgrLight =
      const _BlackColors().shade850; // Chữ đen gần như tuyệt đối
  static Color onBgrLight2 = const _BlackColors().shade200; // Chữ xám đậm
  static Color onBgrLight3 = const _GreyColors().shade500; // Chữ xám phụ

  // Background Dark Mode (Theo tone Dark Card của Qmax)
  static const Color bgrDark = Color(0xFF0E0E12); // Nền tối sâu
  static const Color bgrDark2 = Color(0xFF1E1E2D); // Màu Card tối đặc trưng
  static Color onBgrDark = const _WhiteColors().shade900; // Chữ trắng
  static Color onBgrDark2 = const _GreyColors().shade500; // Chữ xám nhẹ
  static Color onBgrDark3 = const _GreyColors().shade200; // Chữ xám đậm hơn

  static const List<Color> primaries = [AppPalette.primary, Color(0xFF8583FF)];

  static const primaryLinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppPalette.primary, Color(0xFF8583FF)],
  );

  // Black & Navy (Sử dụng tone Navy đậm cho cảm giác tài chính)
  static const black = _BlackColors();

  // White
  static const white = _WhiteColors();

  // Grey
  static const grey = _GreyColors();

  // Colors bổ sung theo thiết kế Qmax
  static const Color violet = Color(0xFF7B78AA);
  static const Color green = Color(0xFF00D09C); // Trùng secondary - Income
  static const Color greenDark = Color.fromARGB(255, 1, 185, 139);
  static const Color blue = Color(0xFF32ADE6);
  static const Color red = Color(0xFFFF4B4B); // Màu Expense đặc trưng
  static const Color orange = Color(0xFFFF9F43);
}

class _BlackColors {
  const _BlackColors();
  // Điều chỉnh sang tone Blue-Grey/Navy cho hợp với Fintech
  Color get shade200 => const Color(0xFF2E2D3D);
  Color get shade400 => const Color(0xFF1A1A24);
  Color get shade800 => const Color(0xFF12121A);
  Color get shade850 => const Color(0xFF0E0E12);
  Color get shade900 => const Color(0xFF000000);

  Color get opacity12 => Colors.black12;
  Color get opacity54 => Colors.black54;
  Color get opacity87 => Colors.black87;
}

class _WhiteColors {
  const _WhiteColors();
  Color get shade700 => const Color(0xFFE2E2E9);
  Color get shade800 => const Color(0xFFF4F4F9);
  Color get shade900 => const Color(0xFFFFFFFF);

  Color get opacity38 => Colors.white38;
  Color get opacity60 => Colors.white60;
  Color get opacity70 => Colors.white70;
}

class _GreyColors {
  const _GreyColors();
  Color get shade200 => const Color(0xFF6F767E); // Xám trung tính của Qmax
  Color get shade500 => const Color(0xFF9AA0A6);
  Color get shade700 => const Color(0xFFC4C4C4);
  Color get shade800 => const Color(0xFFE6E8EC);
  Color get divider => const Color(0xFFF1F1F1); // Divider rất nhẹ
}
