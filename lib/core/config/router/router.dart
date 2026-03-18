import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../features/features.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorApartmentsKey = GlobalKey<NavigatorState>(
  debugLabel: 'apartments',
);
final _shellNavigatorStatsKey = GlobalKey<NavigatorState>(debugLabel: 'stats');
final _shellNavigatorSettingsKey = GlobalKey<NavigatorState>(
  debugLabel: 'settings',
);

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/apartments',
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: [
          // Ветка Квартир
          StatefulShellBranch(
            navigatorKey: _shellNavigatorApartmentsKey,
            routes: [
              GoRoute(
                path: '/apartments',
                builder: (context, state) => const MyApartmentsScreen(),
                routes: [
                  // GoRoute(
                  //   path: 'details/:id',
                  //   builder: (context, state) => ApartmentDetailsScreen(
                  //     id: int.parse(state.pathParameters['id']!),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorStatsKey,
            routes: [
              GoRoute(
                path: '/statistics',
                builder: (context, state) => const StatisticScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettingsKey,
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
