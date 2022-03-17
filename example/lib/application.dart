import 'dart:developer' as developer;
import 'package:example/page/blog_page.dart';
import 'package:example/page/component_page.dart';
import 'package:example/page/design_page.dart';
import 'package:example/page/develop_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late GoRouter _goRouter;

  @override
  void initState() {
    super.initState();
    _goRouter = GoRouter(
      initialLocation: '/design',
      routes: [
        GoRoute(
            path: '/design',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: DesignPage(),
              );
            }),
        GoRoute(
            path: '/component',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: ComponentPage(),
              );
            }),
        GoRoute(
            path: '/develop',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: DevelopPage(),
              );
            }),
        GoRoute(
            path: '/blog',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: BlogPage(),
              );
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routeInformationParser: _goRouter.routeInformationParser,
      routerDelegate: _goRouter.routerDelegate,
    );
  }
}
