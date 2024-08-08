//
// @Author: "Eldor Turgunov"
// @Date: 08.08.2024
// @File name: go_router_example
//

import 'package:bottomnav/home.dart';
import 'package:bottomnav/second.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'message.dart';

class GoRouterExample extends StatelessWidget {
  GoRouterExample({super.key});

  final _parentKey = GlobalKey<NavigatorState>();
  final _shellKey = GlobalKey<NavigatorState>();

  // final subRoutes = GoRoute(
  //   path: "detail",
  //   builder: (context, state) => const MainScreen2(
  //     useRouter: true,
  //   ),
  //   routes: [
  //     GoRoute(
  //       path: "super-detail",
  //       builder: (context, state) => const MainScreen3(),
  //     ),
  //   ],
  // );

  late final GoRouter goRouter = GoRouter(
    /// If you want the app to start on the first tab use this:
    // initialLocation: "/home",
    navigatorKey: _parentKey,
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => Material(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => context.go("/home"),
                  child: const Text("Show Router Example"),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "This screen could be something you require the user to do before entering the main app content (like a login form)",
                  ),
                ),
              ],
            ),
          ),
        ),
        routes: [
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) =>
                PersistentTabView.router(
                  tabs: [
                    PersistentRouterTabConfig(
                      item: ItemConfig(
                        icon: const Icon(Icons.home),
                        title: "Home",
                      ),
                    ),
                    PersistentRouterTabConfig(
                      item: ItemConfig(
                        icon: const Icon(Icons.message),
                        title: "Messages",
                      ),
                    ),
                    PersistentRouterTabConfig(
                      item: ItemConfig(
                        icon: const Icon(Icons.settings),
                        title: "Settings",
                      ),
                    ),
                  ],
                  navBarBuilder: (navBarConfig) => Style1BottomNavBar(
                    navBarConfig: navBarConfig,
                  ),
                  navigationShell: navigationShell,
                ),
            branches: [
              // The route branch for the 1st Tab
              StatefulShellBranch(
                navigatorKey: _shellKey,
                routes: <RouteBase>[
                  GoRoute(
                    path: "home",
                    builder: (context, state) => const HomeScreen(
                      // useRouter: true,
                    ),
                    routes: [
                      GoRoute(
                        parentNavigatorKey: _parentKey,
                        path: "/second",
                        builder: (context, state) => const SecondScreen(
                          // useRouter: true,
                        ),
                        // routes: [
                        //   GoRoute(
                        //     path: "super-detail",
                        //     builder: (context, state) => const MainScreen3(),
                        //   ),
                        // ],
                      ),
                    ],
                  ),
                ],
              ),

              // The route branch for 2nd Tab
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: "messages",
                    builder: (context, state) => const MessageScreen(),
                    routes: [],
                  ),
                ],
              ),

              // The route branch for 3rd Tab
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: "settings",
                    builder: (context, state) => const HomeScreen(
                    ),
                    routes: [],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: "Persistent Bottom Navigation Bar Demo",
    routerConfig: goRouter,
  );
}