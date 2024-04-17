// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthScreen(),
      );
    },
    NoteRoute.name: (routeData) {
      final args = routeData.argsAs<NoteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NoteScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    NotesListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotesListScreen(),
      );
    },
  };
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NoteScreen]
class NoteRoute extends PageRouteInfo<NoteRouteArgs> {
  NoteRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          NoteRoute.name,
          args: NoteRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'NoteRoute';

  static const PageInfo<NoteRouteArgs> page = PageInfo<NoteRouteArgs>(name);
}

class NoteRouteArgs {
  const NoteRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'NoteRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [NotesListScreen]
class NotesListRoute extends PageRouteInfo<void> {
  const NotesListRoute({List<PageRouteInfo>? children})
      : super(
          NotesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotesListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
