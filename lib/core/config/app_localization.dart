import 'package:stocoin/core/bootstrap/helpers.dart';
import 'package:stocoin/core/localization/app_localization.dart';

const localeType = LocaleType.asDefined;

final languageCode = getEnv('DEFAULT_LOCALE', defaultValue: 'en') as String;

const languagesList = <String>['en'];

const assetsDirectory = 'lang/';

const valuesAsMap = <String, String>{};
