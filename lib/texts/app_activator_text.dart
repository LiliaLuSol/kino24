import 'package:kino24/texts/app_text.ru_RU.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:kino24/other/app_export.dart';

class AppLocalization {
  AppLocalization(this.locale);

  Locale locale;

  static final Map<String, Map<String, String>> _localizedValues = {'en': allText};

  static AppLocalization of() {
    return Localizations.of<AppLocalization>(
        NavigatorService.navigatorKey.currentContext!, AppLocalization)!;
  }

  static List<String> languages() => _localizedValues.keys.toList();
  String getString(String text) =>
      _localizedValues[locale.languageCode]![text] ?? text;
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalization.languages().contains(locale.languageCode);

  //Returning a SynchronousFuture here because an async "load" operation
  //cause an async "load" operation
  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}

extension TextExtension on String {
  String get tr => AppLocalization.of().getString(this);
}
