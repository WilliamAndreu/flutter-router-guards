import 'package:myapp/core/guards/auth_guards/user_guard.dart';
import 'package:myapp/core/guards/permissions_guards/admin_guard.dart';
import 'package:myapp/views/dashboard/dashboard_view.dart';
import 'package:myapp/views/home/home_view.dart';
import 'package:myapp/views/login/login_view.dart';
import 'app_router_source.dart';
import 'app_router_util.dart';

final appRouter = AppRouter(
  routes: [
    AppRoute(
      name: '/',
      builder: (context, arguments) => LoginView(),
    ),
 
    AppRoute(
      name: '/home',
      builder: (context, arguments) => const HomeView(),
      guards: [AuthGuard()], // Solo usuarios autenticados pueden acceder
    ),
    AppRoute(
      name: '/admin',
      builder: (context, arguments) => const DashboardView(),
      guards: [
        AuthGuard(), // Primero verificamos que esté autenticado
        AdminGuard(requiredPermissions: ['user']), // Luego que tenga permisos
      ],
    ),
    AppRoute(
      name: '/login',
      builder: (context, arguments) => LoginView(),
    ),

  ],
);
