import 'package:flutter/material.dart';
import '../../guards/guard_source.dart';

class AppRoute {
  final String name;
  final Widget Function(BuildContext, dynamic) builder;
  final List<RouteGuard> guards;

  AppRoute({
    required this.name,
    required this.builder,
    this.guards = const [],
  });
}
