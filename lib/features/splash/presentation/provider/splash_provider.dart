import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_movies/features/splash/presentation/provider/splash_state.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/routes/navigation_service.dart';
import '../../../dashboard/presentation/views/dashboard_screen.dart';

class SplashNotifierProvider extends StateNotifier<SplashState> {
  SplashNotifierProvider(this.ref) : super(SplashState()) {
    getAppVersion();
    animateLogo();
  }

  late final Ref ref;

  void getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    state = state.copyWith(version: packageInfo.version);
  }

  animateLogo() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
      () => state = state.copyWith(logoWidth: 900),
    );
    navigateToDashboardScreen();
  }

  void navigateToDashboardScreen() async {
    await Future.delayed(const Duration(seconds: 1), () {
      NavigationService.navigatorKey.currentState!
          .pushReplacementNamed(DashboardScreen.route);
    });
  }
}
