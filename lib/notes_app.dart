import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/generated/l10n.dart';
import 'package:notes_app/router/router.dart';
import 'package:notes_app/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();

  static void setLocale(BuildContext context, String newLocale) {
    _NotesAppState? state = context.findAncestorStateOfType<_NotesAppState>();
    state?.setLocale(newLocale);
  }
}

class _NotesAppState extends State<NotesApp> {
  final _appRouter = AppRouter();
  var _locale = LocalesKeys.english;

  void setLocale(String value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  void initState() {
    super.initState();

    final sharedPreferences = GetIt.I<SharedPreferences>();
    final userLocale =
        sharedPreferences.getString(SharedPreferencesKeys.locale);

    if (userLocale != null) {
      setLocale(userLocale);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Notes App',
      theme: darkTheme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(_locale),
      routerConfig: _appRouter.config(
        navigatorObservers: () => [TalkerRouteObserver(GetIt.I<Talker>())],
      ),
    );
  }
}
