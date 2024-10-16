import 'package:flutter/material.dart';

typedef GuardCheck = bool Function(BuildContext, dynamic arguments);

class RouteGuard {
  final GuardCheck guardCheck;
  final String redirectTo;

  RouteGuard({required this.guardCheck, required this.redirectTo});
}




