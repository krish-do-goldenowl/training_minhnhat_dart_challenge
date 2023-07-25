import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/cupertino/view/cupertino_screen.dart';
import 'package:gallery_widgets/features/home/view/home_screen.dart';
import 'package:gallery_widgets/features/typography/view/typography_screen.dart';
import 'package:gallery_widgets/router/route_names.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      case RouteNames.cupertino:
        return MaterialPageRoute(
          builder: (context) {
            return const CupertinoScreen();
          },
        );
      case RouteNames.typography:
        return MaterialPageRoute(
          builder: (context) {
            return const TypographyScreen();
          },
        );
      default:
        return _errRoute();
    }
  }

  static Route<dynamic> _errRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(title: const Text('No route')),
          body: const Center(
            child: Text(
              'Something went wrong when trying to load the page',
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
