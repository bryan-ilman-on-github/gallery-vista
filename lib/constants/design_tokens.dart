import 'package:flutter/material.dart';

/// Color constants for the application.
class AppColor {
  /// Light gray color. Value: Color(0xFFF0F0F0).
  static const Color lightGray = Color(0xFFF0F0F0);

  /// Moderate gray color. Value: Color(0xFF969696).
  static const Color moderateGray = Color(0xFF969696);

  /// Heavy gray color. Value: Color(0xFF031727).
  static const Color heavyGray = Color(0xFF031727);

  /// Green color. Value: Color(0xFF3FC4B6).
  static const Color green = Color(0xFF3FC4B6);

  /// Yellow color. Value: Color(0xFFF89F1E).
  static const Color yellow = Color(0xFFF89F1E);

  /// Red color. Value: Color(0xFFE71D35).
  static const Color red = Color(0xFFE71D35);
}

/// Shadow constants for the application.
class Shadow {
  /// White shadow style.
  static BoxShadow white = const BoxShadow(
    color: Colors.white,
    blurRadius: 64,
    spreadRadius: 32,
  );

  /// Yellow shadow style.
  static BoxShadow yellow = BoxShadow(
    color: AppColor.yellow.withOpacity(0.4),
    blurRadius: 16,
    spreadRadius: 4,
    offset: const Offset(0.0, 1.2),
  );
}

/// Text size constants for the application.
class TextSize {
  /// Small text size. Value: 8.0.
  static const double small = 8.0;

  /// Medium text size. Value: 12.0.
  static const double medium = 12.0;

  /// Large text size. Value: 20.0.
  static const double large = 20.0;
}

/// Icon size constants for the application.
class IconSize {
  /// Small icon size. Value: 16.0.
  static const double small = 16.0;

  /// Medium icon size. Value: 24.0.
  static const double medium = 24.0;

  /// Large icon size. Value: 32.0.
  static const double large = 32.0;
}

/// Side size constants for the application.
class SideSize {
  /// Small side size. Value: 32.0.
  static const double small = 32.0;

  /// Medium side size. Value: 40.0.
  static const double medium = 40.0;

  /// Large side size. Value: 52.0.
  static const double large = 52.0;
}

/// Padding size constants for the application.
class PaddingSize {
  /// Small padding size. Value: 8.0.
  static const double small = 8.0;

  /// Medium padding size. Value: 20.0.
  static const double medium = 20.0;

  /// Large padding size. Value: 40.0.
  static const double large = 40.0;
}

/// Margin size constants for the application.
class MarginSize {
  /// Small margin size. Value: 8.0.
  static const double small = 8.0;

  /// Medium margin size. Value: 20.0.
  static const double medium = 20.0;

  /// Large margin size. Value: 40.0.
  static const double large = 40.0;
}

/// Curvature size constants for the application.
class CurvatureSize {
  /// Small curvature size. Value: 8.0.
  static const double small = 8.0;

  /// Medium curvature size. Value: 12.0.
  static const double medium = 12.0;

  /// Large curvature size. Value: 16.0.
  static const double large = 16.0;
}

/// White space size constants for the application.
class WhiteSpaceSize {
  /// Small white space size. Value: 8.0.
  static const double small = 8.0;

  /// Medium white space size. Value: 20.0.
  static const double medium = 20.0;

  /// Large white space size. Value: 40.0.
  static const double large = 40.0;
}
