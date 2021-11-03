import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Localization.configuration(translationLocale: "resources/languages");

    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(primarySwatch: Colors.blue),
    ).modular();
  }
}