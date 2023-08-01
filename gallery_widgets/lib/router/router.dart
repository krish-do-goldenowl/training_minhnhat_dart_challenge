import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/button/view/button_screen.dart';
import 'package:gallery_widgets/features/container_decoration/views/container_decoration_screen.dart';
import 'package:gallery_widgets/features/cupertino/view/cupertino_screen.dart';
import 'package:gallery_widgets/features/custom_shape/views/custom_shape_screen.dart';
import 'package:gallery_widgets/features/home/view/home_screen.dart';
import 'package:gallery_widgets/features/row_column/views/row_column_screen.dart';
import 'package:gallery_widgets/features/stack_align/views/stack_align_screen.dart';
import 'package:gallery_widgets/features/text_field/views/text_field_screen.dart';
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
      case RouteNames.button:
        return MaterialPageRoute(
          builder: (context) {
            return const ButtonScreen();
          },
        );
      case RouteNames.customShape:
        return MaterialPageRoute(
          builder: (context) {
            return const CustomShapeScreen();
          },
        );
      case RouteNames.card:
        return MaterialPageRoute(
          builder: (context) {
            return const ContainerDecorationScreen();
          },
        );
      case RouteNames.stackAndAlign:
        return MaterialPageRoute(
          builder: (context) {
            return const StackAlignScreen();
          },
        );
      case RouteNames.rowAndColumn:
        return MaterialPageRoute(
          builder: (context) {
            return const RowColumnScreen();
          },
        );
      case RouteNames.textField:
        return MaterialPageRoute(
          builder: (context) {
            return const TextFieldScreen();
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
