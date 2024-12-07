import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_movies/core/extensions/context_extensions.dart';
import 'package:my_movies/core/utils/common_exports.dart';

import '../../../../core/di/service_locator.dart';

class SplashScreen extends ConsumerWidget {
  static const String route = "SplashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(splashNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: context.screenHeight,
        width: context.screenWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.grey293441,
              AppColors.grey1a2530,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 48),
            const Spacer(),
            AnimatedContainer(
              width: data.logoWidth,
              duration: const Duration(seconds: 1),
              curve: Curves.linearToEaseOut,
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.splashLogo,
                width: context.screenWidth,
              ),
            ),
            const Spacer(),
            Text(
              data.version != null ? "Version ${data.version}" : "",
              style: AppTextStyle.textSMregular.copyWith(
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
