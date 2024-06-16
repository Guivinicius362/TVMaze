import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvmaze_core/tvmaze_core.dart';

Future<void> pumpWidgetWithMaterial(WidgetTester tester, Widget widget) async {
  return tester.pumpWidget(
    MaterialApp(
      home: widget,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    ),
  );
}
