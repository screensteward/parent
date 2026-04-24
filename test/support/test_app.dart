import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'package:screensteward_parent/l10n/app_localizations.dart';

/// Wraps a [GoRouter] in a [MaterialApp.router] configured with the app's
/// localisation delegates so widgets under test can call
/// `AppLocalizations.of(context)` without crashing, and tests can assert on
/// translated strings deterministically (locale pinned to `fr`).
MaterialApp testRouterApp(GoRouter router, {Locale locale = const Locale('fr')}) {
  return MaterialApp.router(
    routerConfig: router,
    locale: locale,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
  );
}
