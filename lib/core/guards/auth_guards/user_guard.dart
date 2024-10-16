import '../guard_source.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(
    guardCheck: (context, arguments) {
      // Aquí defines la lógica para verificar si el usuario está autenticado.
      final isAuthenticated = true; // Simulación: cambiar por la lógica real
      return isAuthenticated;
    },
    redirectTo: '/login',
  );
}