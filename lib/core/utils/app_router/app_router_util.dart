import 'package:flutter/material.dart';
import '../../../views/not_found/not_found_view.dart';
import 'app_router_source.dart';
class AppRouter {
  
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  late final List<AppRoute> routes;

  AppRouter({required this.routes});

  Route<dynamic> generateRoute(RouteSettings settings) {
    final route = routes.firstWhere(
      (r) => r.name == settings.name,
      orElse: () => AppRoute(
        name: 'not_found',
        builder: (context, _) => const NotFoundView(),
      ),
    );

    for (final guard in route.guards) {
      if (!guard.guardCheck(navigatorKey.currentContext!, settings.arguments)) {
        return MaterialPageRoute(
          builder: (context) => routes
              .firstWhere((r) => r.name == guard.redirectTo)
              .builder(context, settings.arguments),
        );
      }
    }

    return MaterialPageRoute(
      builder: (context) => route.builder(context, settings.arguments),
      settings: settings,
    );
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacement(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushAndRemoveUntil(String routeName, {dynamic arguments, bool Function(Route<dynamic>)? predicate}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      predicate ?? (_) => false, // Si no se proporciona predicado, elimina todas las rutas
      arguments: arguments,
    );
  }

  Future<dynamic> popAndPushNamed(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.popAndPushNamed(routeName, arguments: arguments);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }

  BuildContext? get currentContext {
    return navigatorKey.currentState?.context;
  }
}
