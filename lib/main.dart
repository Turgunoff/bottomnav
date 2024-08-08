import 'package:bottomnav/profile.dart';
import 'package:bottomnav/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'interactive_example.dart';
import 'message.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // make navigation bar transparent
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  // make flutter draw behind navigation bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Persistent Bottom Navigation Bar Demo",
        home: App(),
      );
}

class App extends StatelessWidget {
  const App({super.key});

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: const MessageScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.message),
            title: "Messages",
          ),
        ),
        PersistentTabConfig(
          screen: const ProfileScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.person),
            title: "Profile",
          ),
        ),
        // PersistentTabConfig(
        //   screen: const ProfileScreen(),
        //   item: ItemConfig(
        //     icon: const Icon(Icons.person),
        //     title: "Profile",
        //   ),
        // ),
        // PersistentTabConfig(
        //   screen: const ProfileScreen(),
        //   item: ItemConfig(
        //     icon: const Icon(Icons.person),
        //     title: "Profile",
        //   ),
        // ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style4BottomNavBar(
          navBarDecoration: const NavBarDecoration(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          ),
          itemAnimationProperties: const ItemAnimation(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 300),
          ),
          navBarConfig: navBarConfig,
        ),
      );
}
