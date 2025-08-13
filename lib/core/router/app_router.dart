import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tasks_md/core/router/route_paths.dart';
import 'package:flutter_tasks_md/core/router/routes/routes.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider((ref){



    return GoRouter(
      initialLocation: RoutePaths.main,
      routes: [
        ...AppRoutes.routes
      ]
    );





});