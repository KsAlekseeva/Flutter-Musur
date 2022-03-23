export 'favourites.dart';
export 'home_route/home_route.dart';
export 'home_route/my_playlist.dart';
export 'now_playing.dart';
export 'search.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:musur/musur.dart';

final goRouterProvider = Provider(
  (ref) => GoRouter(
    initialLocation: '/${Routes.home}',
    routes: <GoRoute>[
      GoRoute(
        name: Routes.home,
        path: '/${Routes.home}',
        builder: (BuildContext context, GoRouterState state) =>
            const HomeRoute(),
      ),
      GoRoute(
        name: Routes.favourites,
        path: '/${Routes.favourites}',
        builder: (BuildContext context, GoRouterState state) =>
            const FavouritesRoute(),
      ),
      GoRoute(
        name: Routes.search,
        path: '/${Routes.search}',
        builder: (BuildContext context, GoRouterState state) =>
            const SearchRoute(),
      ),
      GoRoute(
        name: Routes.nowPlaying,
        path: '/${Routes.nowPlaying}',
        builder: (BuildContext context, GoRouterState state) =>
            const PlayingRoute(),
      ),
    ],
  ),
);

class Routes {
  Routes._();

  static const home = 'home';
  static const favourites = 'favourites';
  static const search = 'search';
  static const nowPlaying = 'nowPlaying';
}
