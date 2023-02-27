import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:starter/ui/app.dart';
import 'package:starter/ui/screens/about/about_screen.dart';
import 'package:starter/ui/screens/example_detail_screen.dart';
import 'package:starter/ui/screens/errors/not_found_screen.dart';
import 'package:starter/ui/router/arguments/example_argument.dart';
import 'package:starter/ui/screens/languages/languages_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const App());
      case '/about':
        return CupertinoPageRoute(builder: (_) => const AboutScreen());
      case '/languages':
        return CupertinoPageRoute(builder: (_) => const LanguagesScreen());

      case '/example/detail':
        if (arguments is ExampleArguments) {
          return CupertinoPageRoute(
              builder: (_) => ExmDetailScreen(slug: arguments.slug));
        }
        return notFound(settings);
      default:
        return notFound(settings);
    }
  }

  static CupertinoPageRoute<dynamic> notFound(RouteSettings settings) {
    return CupertinoPageRoute(
      builder: (_) =>
          NotFoundScreen(message: 'Route not found: ${settings.name}'),
    );
  }
}
