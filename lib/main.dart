import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:null_safety_demo_flutter/AppLocalizations.dart';
import 'package:null_safety_demo_flutter/AppLocalizationsDelegate.dart';
import 'package:null_safety_demo_flutter/MyHomePage.dart';
import 'package:null_safety_demo_flutter/language/bloc/lang_bloc.dart';

void main() {
  runApp(
      BlocProvider<LangBloc>(create: (context) => LangBloc(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LangBloc, LangState>(builder: ((context, state) {
      return MaterialApp(
        locale: state is LangSuccess
            ? state.locale
            : Locale('en',
                ''), // this is important for locale to change for whole app
        title: 'language support Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('es', ''),
        ],
        home: const MyHomePage(),
      );
    }));
  }
}
