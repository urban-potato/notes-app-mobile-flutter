import 'package:auto_route/auto_route.dart';
import 'package:notes_app/features/auth/index.dart';
import 'package:notes_app/features/notes_list/index.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: NotesListRoute.page, path: '/notes_list'),
        AutoRoute(page: AuthRoute.page, path: '/auth', initial: true),
      ];
}
