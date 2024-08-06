import 'package:go_router/go_router.dart';

import '../view/home/home_screen.dart';
import '../view/onboard/onboard_view.dart';
import '../view/splash/splash_veiw.dart';

class AppRoute {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';

  static final routerConfig = GoRouter(routes: [
    GoRoute(
      path: splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: onboarding,
      builder: (context, state) => const OnboardView(),
    ),
    GoRoute(
      path: home,
      builder: (context, state) => const HomeScreen(),
    ),
  ]);
}
