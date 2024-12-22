import 'package:flutter/material.dart';
import 'package:stroll_bonfire/core/enums/route_enum.dart';

extension MediaQueryExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  Size get screenSize => MediaQuery.of(this).size;
  double get screenHeight => screenSize.height;
  double get screenWidth => screenSize.width;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get appBarHeight => AppBar().preferredSize.height;
  double get bodyHeight => screenHeight - statusBarHeight - appBarHeight;
}

extension NavigationExtension on BuildContext {
  Future<T?> push<T extends Object>(
    Widget page, {
    RouteTransition transition = RouteTransition.none,
  }) {
    return Navigator.of(this).push(_createRoute(page, transition));
  }

  void pushReplacement(
    Widget page, {
    RouteTransition transition = RouteTransition.none,
  }) {
    Navigator.of(this).pushReplacement(_createRoute(page, transition));
  }

  void pop<T>([T? result]) {
    Navigator.of(this).pop(result);
  }

  void pushAndRemoveUntil(
    Widget page, {
    RouteTransition transition = RouteTransition.none,
  }) {
    Navigator.of(this).pushAndRemoveUntil(
      _createRoute(page, transition),
      (Route<dynamic> route) => false,
    );
  }

  void popUntil<T>([int popNo = 1]) {
    int count = 0;

    Navigator.of(this).popUntil(
      (route) => count++ >= popNo,
    );
  }

  void pushNamed(
    String routeName, {
    RouteTransition transition = RouteTransition.none,
    Object? arguments,
  }) {
    Navigator.of(this)
        .push(_createNamedRoute(routeName, transition, arguments));
  }

  void pushReplacementNamed(
    String routeName, {
    RouteTransition transition = RouteTransition.none,
    Object? arguments,
  }) {
    Navigator.of(this)
        .pushReplacement(_createNamedRoute(routeName, transition, arguments));
  }

  void pushNamedAndRemoveUntil(
    String routeName, {
    RouteTransition transition = RouteTransition.none,
    Object? arguments,
  }) {
    Navigator.of(this).pushAndRemoveUntil(
      _createNamedRoute(routeName, transition, arguments),
      (Route<dynamic> route) => false,
    );
  }

  Route<T> _createRoute<T>(Widget page, RouteTransition transition) {
    switch (transition) {
      case RouteTransition.fadeIn:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case RouteTransition.slideFromRight:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.ease;
            final tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      case RouteTransition.slideFromBottom:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.ease;
            final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
                .chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      case RouteTransition.scale:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.easeInOut;
            final tween =
                Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
            return ScaleTransition(scale: animation.drive(tween), child: child);
          },
        );
      case RouteTransition.none:
      default:
        return MaterialPageRoute(builder: (context) => page);
    }
  }

  Route _createNamedRoute(
    String routeName,
    RouteTransition transition,
    Object? arguments,
  ) {
    final routeFactory = Navigator.of(this).widget.onGenerateRoute;

    if (routeFactory == null) {
      throw Exception(
        'No route factory found. Please provide onGenerateRoute in MaterialApp.',
      );
    }

    final RouteSettings settings =
        RouteSettings(name: routeName, arguments: arguments);
    final Route? route = routeFactory(settings);

    if (route == null) {
      throw Exception('Route not found for name: $routeName');
    }

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        final Widget page = route is MaterialPageRoute
            ? route.builder(context)
            : const SizedBox(
                child: Text(
                  'No route found',
                ),
              );
        return page;
      },
      settings: route.settings,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (transition) {
          case RouteTransition.fadeIn:
            return FadeTransition(opacity: animation, child: child);
          case RouteTransition.slideFromRight:
            const curve = Curves.ease;
            final tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          case RouteTransition.slideFromBottom:
            const curve = Curves.ease;
            final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
                .chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          case RouteTransition.scale:
            const curve = Curves.easeInOut;
            final tween =
                Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
            return ScaleTransition(scale: animation.drive(tween), child: child);
          case RouteTransition.none:
          default:
            return child;
        }
      },
    );
  }
}
