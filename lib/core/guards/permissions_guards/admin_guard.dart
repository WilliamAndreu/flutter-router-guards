import '../guard_source.dart';

class AdminGuard extends RouteGuard {
  final List<String> requiredPermissions;

  AdminGuard({required this.requiredPermissions})
      : super(
          guardCheck: (context, arguments) {
            final userPermissions = ['admin'];
            return requiredPermissions.every((perm) => userPermissions.contains(perm));
          },
          redirectTo: '/login',
        );
}
