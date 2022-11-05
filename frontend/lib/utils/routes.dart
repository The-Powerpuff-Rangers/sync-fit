import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_fit/main.dart';
import 'package:sync_fit/pages/home/home_page.dart';

import '../pages/splash/splash_screen.dart';

/// Providers all the Routers.
/// Managed by GoRouter.
final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: AuthChecker.routename,
      routes: [
        GoRoute(
          name: 'AuthChecker',
          path: AuthChecker.routename,
          builder: (context, state) => const AuthChecker(),
        ),
        GoRoute(
          name: 'SplashScreen',
          path: SplashScreen.routename,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          name: 'HomePage',
          path: HomePage.routename,
          builder: (context, state) =>  HomePage(),
        )
      ],

      /// TODO: Will beautify it More. but its rare to come across this page
      errorPageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: Scaffold(
            body: Center(
              child: Text('Error: ${state.error.toString()}'),
            ),
          )),
    );
  },
);
