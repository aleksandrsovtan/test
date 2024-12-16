import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:test_task/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      initialRoute: Routes.home,
      smartManagement: SmartManagement.keepFactory,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      themeMode: ThemeMode.light,
      getPages: GetPages.allGetPages(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      localeResolutionCallback: (final locale, final supportedLocales) {
        return AppLocalizations.supportedLocales.first;
      },
      supportedLocales: AppLocalizations.supportedLocales,
    ),
  );
}
