import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/notes_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    GoogleFonts.config.allowRuntimeFetching = false;

    final sharedPreferences = await SharedPreferences.getInstance();
    GetIt.I.registerSingleton(sharedPreferences);

    final Dio dio = Dio();
    final talker = TalkerFlutter.init();

    dio.interceptors.add(
      TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(
          printResponseData: false,
        ),
      ),
    );

    Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(
        printStateFullData: false,
        printEventFullData: false,
      ),
    );

    GetIt.I.registerSingleton(talker);
    GetIt.I<Talker>().debug('Talker started...');

    // TODO: Register Repository

    FlutterError.onError =
        (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

    runApp(const NotesApp());
  }, (error, stack) {
    GetIt.I<Talker>().handle(error, stack);
  });
}
