import 'package:stocoin/core/bootstrap/base_theme_config.dart';
import 'package:stocoin/core/theme/dark_theme.dart';
import 'package:stocoin/core/theme/light_theme.dart';
import 'package:stocoin/core/theme/styles/dark_theme_colors.dart';
import 'package:stocoin/core/theme/styles/light_theme_colors.dart';
import 'package:stocoin/core/theme/styles/styles.dart';

final appThemes = [
  light(),
  dark(),
];

const appNameFont = 'titillium';

ColorStyles lightColors = LightThemeColors();
ColorStyles darkColors = DarkThemeColors();

BaseThemeConfig light() => BaseThemeConfig(
      id: 'light_theme',
      description: 'Light Theme',
      theme: lightTheme(lightColors),
      colors: lightColors,
    );

BaseThemeConfig dark() => BaseThemeConfig(
      id: 'dark_theme',
      description: 'Dark Theme',
      theme: darkTheme(darkColors),
      colors: darkColors,
    );
