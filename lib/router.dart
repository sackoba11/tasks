import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'utils/constants/routes.dart';
import 'views/add_task/add_task_screen.dart';
import 'views/details_task/details_task.dart';
import 'views/home_screen.dart/home_screen.dart';
import 'views/profile/profile_screen.dart';
import 'views/task_completed/task_completed_screen.dart';
import 'views/task_in_progress/task_in_progress_screen.dart';
import 'widgets/base_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

class Routers {
  // GoRouter configuration
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavbar(navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey,
            routes: [
              GoRoute(
                // Optional, add name to your routes. Allows you navigate by name instead of path
                path: Routes.home,
                builder: (context, state) => HomeScreen(),
                routes: <RouteBase>[
                  // Add child routes
                  GoRoute(
                    path:
                        Routes
                            .taskDetails, // This will be appended to the parent route's path
                    builder: (context, state) => DetailsTask(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.taskInProgress,
                builder: (context, state) => TaskInProgressScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.taskCompleted,
                builder: (context, state) => TaskCompletedScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.profile,
                builder: (context, state) => ProfileScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.addTask,
                builder: (context, state) => AddTaskScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
