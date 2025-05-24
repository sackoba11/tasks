import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'models/task.dart';
import 'utils/constants/routes.dart';
import 'views/add_task/add_task_screen.dart';
import 'views/all_tasks_screen/all_tasks_screen.dart';
import 'views/details_task/details_task.dart';
import 'views/home_screen.dart/home_screen.dart';
import 'views/profile/profile_screen.dart';
import 'views/task_completed/task_completed_screen.dart';
import 'views/task_in_progress/task_in_progress_screen.dart';
import 'views/base_screen.dart';
import 'views/tasks_pending_screen/tasks_pending_screen.dart';

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
                name: Routes.home,
                path: Routes.home,
                builder: (context, state) => HomeScreen(),
                routes: [
                  GoRoute(
                    path: Routes.allTasks,
                    builder: (context, state) => AllTasksScreen(),
                  ),
                  GoRoute(
                    path: Routes.taskPending,
                    builder: (context, state) => TasksPendingScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.taskInProgress,
                path: Routes.taskInProgress,
                builder: (context, state) => TaskInProgressScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.taskCompleted,
                path: Routes.taskCompleted,
                builder: (context, state) => TaskCompletedScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.profile,
                path: Routes.profile,
                builder: (context, state) => ProfileScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.addTask,
                path: Routes.addTask,
                builder: (context, state) => AddTaskScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: Routes.taskDetails,
        name: Routes.taskDetails,
        builder: (context, state) {
          Task task = state.extra as Task;
          String? path = state.uri.queryParameters['path'];
          return DetailsTask(task: task, pathToPop: path);
        },
      ),
    ],
  );
}
