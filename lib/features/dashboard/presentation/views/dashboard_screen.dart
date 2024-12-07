import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_movies/core/di/service_locator.dart';
import 'package:my_movies/core/extensions/context_extensions.dart';
import 'package:my_movies/features/home/presentation/views/home_screen.dart';

import '../../../../core/utils/common_exports.dart';
import '../../../../core/utils/widgets/app_bar.dart';
import '../../../favourite/presentation/views/favourite_screen.dart';

class DashboardScreen extends ConsumerWidget {
  static const String route = "DashboardScreen";
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dashboardNotifierProvider);
    final notifier = ref.read(dashboardNotifierProvider.notifier);
    return Scaffold(
      appBar: CustomAppBar(
        title:
            data.currentBnbIndex == 0 ? AppStrings.home : AppStrings.favourite,
        showLeading: false,
      ),
      body: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: PageView(
          controller: notifier.pageController,
          children: const [
            HomeScreen(),
            FavouriteScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,
        selectedLabelStyle:
            AppTextStyle.textSMmedium.copyWith(color: AppColors.primary),
        unselectedLabelStyle: AppTextStyle.textSMregular,
        currentIndex: data.currentBnbIndex,
        onTap: (index) => notifier.changeBnbIndex(index),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.home,
              height: 20,
              width: 20,
              colorFilter: ColorFilter.mode(
                data.currentBnbIndex == 0
                    ? AppColors.primary
                    : AppColors.grey98A2B3,
                BlendMode.srcIn,
              ),
            ),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.favourite,
              height: 20,
              width: 20,
              colorFilter: ColorFilter.mode(
                data.currentBnbIndex == 1
                    ? AppColors.primary
                    : AppColors.grey98A2B3,
                BlendMode.srcIn,
              ),
            ),
            label: AppStrings.favourite,
          ),
        ],
      ),
    );
  }
}
