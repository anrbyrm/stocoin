import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum LocaleType { device, asDefined }

class Localized extends HookWidget {
  const Localized(this.child);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final key = UniqueKey();

    return Container(
      key: key,
      child: child,
    );
  }
}

extension Translation on String {
  String translate({Map<String, String>? arguments}) =>
      Localization.instance.translate(this, arguments);
}

class Localization {
  Localization._();

  static final instance = Localization._();

  /// config
  LocaleType? localeType;
  List<String>? langList;
  String? assetsDir;
  Locale? locale;
  Map<String, dynamic>? values;

  Future<void> init({
    LocaleType? localeType = LocaleType.asDefined,
    String? languageCode,
    List<String> languagesList = const ['en'],
    String? assetsDirectory = 'lang/',
    Map<String, String>? valuesAsMap,
  }) async {
    assetsDir = assetsDirectory;

    this.localeType = localeType ?? LocaleType.device;

    langList = languagesList;

    if (languageCode != null) {
      locale = Locale(languageCode);
    } else {
      locale = Locale(languagesList[0]);
    }

    if (assetsDir != null) {
      values = await initLanguage(languageCode);
    } else {
      values = valuesAsMap;
    }
  }

  Future<Map<String, String>> initLanguage(String? languageCode) async {
    final filePath = '$assetsDir$languageCode.json';
    final content = await rootBundle.loadString(filePath);
    return json.decode(content) as Map<String, String>;
  }

  String translate(String key, [Map<String, String>? arguments]) {
    final value = (values == null || values![key] == null) ? key : values![key];

    String? returnValue = value as String;

    if (_isNestedKey(key)) {
      returnValue = _getNested(key);
    }

    if (returnValue == null) {
      return key;
    }

    if (arguments == null) return returnValue;

    for (final key in arguments.keys) {
      returnValue = returnValue?.replaceAll('{{$key}}', arguments[key]!);
    }

    return returnValue ?? '';
  }

  String? _getNested(String key) {
    if (_isNestedCached(key)) return values![key] as String;

    final keys = key.split('.');
    final kHead = keys.first;

    var value = values![kHead];

    for (var i = 1; i < keys.length; i++) {
      if (value is Map<String, dynamic>) value = value[keys[i]];
    }

    if (value != null) {
      _cacheNestedKey(key, value as String);
    }

    return value as String;
  }

  bool _isNestedCached(String key) => values!.containsKey(key);

  void _cacheNestedKey(String key, String value) {
    if (!_isNestedKey(key)) {
      throw Exception('Cannot cache a key that is not nested.');
    }

    values![key] = value;
  }

  bool _isNestedKey(String key) =>
      !values!.containsKey(key) && key.contains('.');

  Future<void> setLanguage(
    BuildContext? context, {
    required String? language,
  }) async {
    locale = Locale(language!, '');

    final filePath = '$assetsDir$language.json';
    final content = await rootBundle.loadString(filePath);

    values = json.decode(content) as Map<String, String>;
  }

  Future<void> setLocale({
    required Locale? locale,
  }) async {
    this.locale = locale;

    final filePath = "$assetsDir${locale!.languageCode}.json";
    final content = await rootBundle.loadString(filePath);

    values = json.decode(content) as Map<String, String>;
  }

  String? get languageCode => locale!.languageCode;

  Iterable<LocalizationsDelegate> get delegates => [
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ];

  Iterable<Locale> locals() =>
      langList!.map<Locale>((lang) => Locale(lang, ''));
}
