import 'package:flexio_kvl/theme/theme_colors.dart';
import 'package:flutter/widgets.dart';

class FlexioTheme {
  static final _lightTheme = FlexioTheme(
    colors: FlexioThemeColors(
      primary: ThemeColors.primary,
      background: ThemeColors.background,
      backgroundLight: ThemeColors.backgroundLight,
      text: ThemeColors.text,
      textSubtle: ThemeColors.subtle,
      dividerColor: ThemeColors.subtle.withOpacity(0.01),
      shadowColor: ThemeColors.shadow,
    ),
    primaryText: FlexioThemeTextStyles.fromColor(ThemeColors.primary),
    secondaryText: FlexioThemeTextStyles.fromColor(ThemeColors.secondaryText),
    defaultText: FlexioThemeTextStyles.fromColor(ThemeColors.text),
    subtleText: FlexioThemeTextStyles.fromColor(ThemeColors.subtle),
  );

  static FlexioTheme of(BuildContext context) => _lightTheme;

  final FlexioThemeColors colors;
  final FlexioThemeTextStyles primaryText;
  final FlexioThemeTextStyles secondaryText;
  final FlexioThemeTextStyles defaultText;
  final FlexioThemeTextStyles subtleText;

  const FlexioTheme({
    required this.colors,
    required this.primaryText,
    required this.secondaryText,
    required this.defaultText,
    required this.subtleText,
  });
}

class FlexioThemeColors {
  final Color primary;
  final Color background;
  final Color backgroundLight;
  final Color text;
  final Color textSubtle;
  final Color dividerColor;
  final Color shadowColor;

  const FlexioThemeColors({
    required this.primary,
    required this.background,
    required this.backgroundLight,
    required this.text,
    required this.textSubtle,
    required this.dividerColor,
    required this.shadowColor,
  });
}

class FlexioThemeTextStyles {
  final TextStyle title;
  final TextStyle titleSmall;
  final TextStyle body;
  final TextStyle subtitle;

  const FlexioThemeTextStyles({
    required this.title,
    required this.titleSmall,
    required this.body,
    required this.subtitle,
  });

  factory FlexioThemeTextStyles.fromColor(Color color) => FlexioThemeTextStyles(
        title: TextStyle(color: color, fontSize: 21, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w600),
        body: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w400),
        subtitle: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w600),
      );
}
