import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_movies/core/di/service_locator.dart';
import 'package:my_movies/core/extensions/context_extensions.dart';
import 'package:my_movies/features/home/presentation/widgets/home_list_item.dart';

import '../../../../core/utils/common_exports.dart';
import '../../../../core/utils/widgets/app_text_form_field.dart';
import '../widgets/home_loading_shimmer.dart';

class HomeScreen extends ConsumerWidget {
  static const String route = "HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(homeNotifierProvider);
    final notifier = ref.read(homeNotifierProvider.notifier);
    return SizedBox(
      height: context.screenHeight,
      width: context.screenWidth,
      child: CustomMaterialIndicator(
        onRefresh: () => notifier.checkNetwork(), // Your refresh logic
        backgroundColor: Colors.white,
        indicatorBuilder: (context, controller) {
          return const Padding(
            padding: EdgeInsets.all(6.0),
            child: CircularProgressIndicator(
              color: AppColors.primary,
              // value: controller.state.isLoading ? null : math.min(controller.value, 1.0),
            ),
          );
        },
        child: SafeArea(
          child: data.isLoading
              ? const HomeLoadingShimmer()
              : Column(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppTextFormField(
                        textEditingController: notifier.searchController,
                        focusNode: notifier.searchFocusNode,
                        hasFocus: false,
                        hintText: "Search",
                        hintTextStyle: AppTextStyle.textSMmedium.copyWith(
                          color: AppColors.grey98A2B3,
                        ),
                        fillColor: AppColors.white,
                        height: 44,
                        keyboardType: TextInputType.text,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            AppImages.search,
                            height: 20,
                            width: 20,
                            colorFilter: const ColorFilter.mode(
                              AppColors.grey5D667B,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        onChanged: (val) => notifier.setSearchedQuery(val),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        itemCount: data.allMovies!
                            .where(
                              (element) => element.title!
                                  .toLowerCase()
                                  .contains(data.searchedQuery.toLowerCase()),
                            )
                            .toList()
                            .length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemBuilder: (context, index) => HomeListItem(
                          item: data.allMovies!
                              .where(
                                (element) => element.title!
                                    .toLowerCase()
                                    .contains(data.searchedQuery.toLowerCase()),
                              )
                              .toList()[index],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
