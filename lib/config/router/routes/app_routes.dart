import 'package:flutter_tasks_md/config/router/route_paths.dart';
import 'package:flutter_tasks_md/features/home/presentation/screens/screens.dart';

import 'package:go_router/go_router.dart';

class AppRoutes {


  static List<GoRoute> get routes{

    return<GoRoute>[
      GoRoute(
        path: RoutePaths.main,
builder: (context, state) => const WelcomeScreen(),
        ),

      GoRoute(
        path: RoutePaths.checkAllTask,
        builder: (context, state) => const ListTaskScreen(),
        ),

      GoRoute(
        path: RoutePaths.formularioAddTask,
        builder: (context, state) => const FormAddTaskScreen(),
        ),


    ];
  }
}