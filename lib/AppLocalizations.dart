import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:null_safety_demo_flutter/AppLocalizationsDelegate.dart';

class AppLocalizations {
  late Locale locale;
  late Map<String, String> _valueText;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  Future loadTranslateFile(String lng) async {
    // String _langFile =
    //     await rootBundle.loadString('assets/l10n/${locale.languageCode}.json');   //uncomment this if u want device language

    String _langFile = await rootBundle.loadString('assets/l10n/$lng');

    Map<String, dynamic> _json = jsonDecode(_langFile);
    _valueText = _json.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslate(String key) {
    return _valueText[key]!;
  }
}
