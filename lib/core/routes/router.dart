import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tugas_akhir_lj/core/routes/route_path.dart';
import 'package:tugas_akhir_lj/core/routes/route_name.dart';
import 'package:tugas_akhir_lj/data/models/ai_models.dart';
import 'package:tugas_akhir_lj/presentation/navigation/navigation.dart';
import 'package:tugas_akhir_lj/presentation/predict/predict.dart';
import 'package:tugas_akhir_lj/presentation/predict/predict_input.dart';

final _rootNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'RootNavigator');
final _predictNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'PredictNavigator');
final _modelInfoNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'ModelInfoNavigator');

final routerProvider = Provider<GoRouter>((ref) {
  final routes = [
    StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state, navigationShell) {
          return _tugasAkhirPage(
            context: context,
            child: Navigation(
              navigationShell: navigationShell,
            ),
            state: state,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _predictNavigatorKey,
            routes: [
              GoRoute(
                path: RoutePath.predict,
                name: RouteName.predict,
                pageBuilder: (context, state) {
                  return _tugasAkhirPage(
                      child: PredictPage(),
                      state: state,
                      context: context);
                },
                routes: [
                  GoRoute(
                      path: RouteName.predictInput,
                    name: RouteName.predictInput,
                    pageBuilder: (context, state) {
                      return _tugasAkhirPage(
                          child: PredictInputPage(
                              modelData: state.extra as AiModels),
                          state: state,
                          context: context
                      );
                    },
                  )
                ]
              ),
            ]
          ),
          StatefulShellBranch(
            navigatorKey: _modelInfoNavigatorKey,
            routes: [
              GoRoute(
                path: RoutePath.modelInfo,
                name: RouteName.modelInfo,
                pageBuilder: (context, state) {
                  return _tugasAkhirPage(
                      child: PredictPage(),
                      state: state,
                      context: context);
                },
              )
            ]
          ),
        ]),
    //GoRoute(
    //  path: RoutePath.splash,
    //  name: RouteName.splash,
    //  pageBuilder: (context, state) {
    //    return _tugasAkhirPage(
    //    context: context,
    //    child: const SplashPage(),
    //    state: state,
    //  );
    //},
    //),
  ];

  return GoRouter(
    initialLocation: RoutePath.predict,
    debugLogDiagnostics: !kReleaseMode,
    navigatorKey: _rootNavigatorKey,
    routes: routes,
  );
});

Page _tugasAkhirPage({
  required Widget child,
  required GoRouterState state,
  required BuildContext context,
}) {
  if (Platform.isAndroid) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic)),
          child: child,
        );
      },
    );
  }
  return CupertinoPage(
    key: state.pageKey,
    child: child,
  );
}
