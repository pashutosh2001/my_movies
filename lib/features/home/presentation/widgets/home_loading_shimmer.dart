import 'package:my_movies/core/utils/widgets/app_shimmer.dart';

import '../../../../core/utils/common_exports.dart';

class HomeLoadingShimmer extends StatelessWidget {
  const HomeLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.greyD0D5DD,
            width: 1.0,
          ),
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppShimmer(
              height: 80,
              width: 100,
              radius: 6,
            ),
            SizedBox(width: 10),
            Expanded(
              child: AppShimmer(
                height: 24,
                width: double.maxFinite,
                radius: 4,
              ),
            ),
            SizedBox(width: 12),
            AppShimmer(
              height: 32,
              width: 32,
              radius: 16,
            ),
          ],
        ),
      ),
    );
  }
}
