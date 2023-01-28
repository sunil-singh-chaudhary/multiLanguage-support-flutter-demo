import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_safety_demo_flutter/AppLocalizations.dart';

import 'language/bloc/lang_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Object? lang = 'en';
    List languages = ["en", "es"];
    return BlocBuilder<LangBloc, LangState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              DropdownButton(
                dropdownColor: Colors.deepPurpleAccent[100],
                underline: SizedBox(),
                value: state is LangSuccess ? 'es' : "en",
                onChanged: (value) {
                  setState(() {
                    if (value == 'es') {
                      print('es click');
                      BlocProvider.of<LangBloc>(context)
                          .add(FetchLanguageEvent(local: Locale('es', '')));
                    } else {
                      print('en click');
                      BlocProvider.of<LangBloc>(context)
                          .add(FetchLanguageEvent(local: Locale('en', '')));
                    }

                    lang = value as String;
                  });
                },
                items: languages.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ],
            title: Text(
              AppLocalizations.of(context).getTranslate('title_Home'),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).getTranslate('counter'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
