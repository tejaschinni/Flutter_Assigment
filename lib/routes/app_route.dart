import 'package:go_router/go_router.dart';
import 'package:testapp/features/auth_screen/screen/auth_screen.dart';
import 'package:testapp/features/auth_screen/screen/sign_in_screen.dart';
import 'package:testapp/features/dashboard/screens/dashboar_screen.dart';
import 'package:testapp/features/splash/screen/splash_screen.dart';

class AppRoute {
  static final router = GoRouter(initialLocation: '/', routes: [
    GoRoute(path: '/', builder: ((context, state) => const SplashScreen())),
    GoRoute(
        path: '/auth',
        builder: ((context, state) => const AuthScreen()),
        routes: [
          GoRoute(
            path: 'signup',
            builder: ((context, state) => const SignUpScreen()),
          )
        ]),
    GoRoute(
        path: '/home', builder: ((context, state) => const DashBoardScreen())),
  ]);
}
