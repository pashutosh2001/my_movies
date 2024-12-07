import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_movies/features/dashboard/presentation/provider/dashboard_provider.dart';
import 'package:my_movies/features/dashboard/presentation/provider/dashboard_state.dart';
import 'package:my_movies/features/home/presentation/provider/home_provider.dart';
import 'package:my_movies/features/home/presentation/provider/home_state.dart';

import '../../features/splash/presentation/provider/splash_provider.dart';
import '../../features/splash/presentation/provider/splash_state.dart';
import '../network/api_client.dart';

/// networking provider
final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

/// splash notifier
final splashNotifierProvider =
    StateNotifierProvider<SplashNotifierProvider, SplashState>(
  (ref) {
    return SplashNotifierProvider(ref);
  },
);

/// dashboard notifier
final dashboardNotifierProvider =
    StateNotifierProvider<DashboardNotifierProvider, DashboardState>(
  (ref) {
    return DashboardNotifierProvider();
  },
);

/// home notifier
final homeNotifierProvider =
    StateNotifierProvider<HomeNotifierProvider, HomeState>(
  (ref) {
    return HomeNotifierProvider(ref);
  },
);
