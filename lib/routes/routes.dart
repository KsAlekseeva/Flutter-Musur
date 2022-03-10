export 'home_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:musur/musur.dart';

final goRouterProvider = Provider(
  (ref) => GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomeRoute(),
      ),
    ],
  ),
);
