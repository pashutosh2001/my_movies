import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_movies/core/di/service_locator.dart';
import 'package:my_movies/core/routes/navigation_service.dart';
import 'package:my_movies/core/utils/widgets/custom_network_image.dart';
import 'package:my_movies/features/home/data/models/movies_model.dart';
import 'package:my_movies/features/home/presentation/views/movie_detail_screen.dart';

import '../../../../core/utils/common_exports.dart';

class HomeListItem extends ConsumerWidget {
  final MoviesModel item;
  const HomeListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => NavigationService.navigatorKey.currentState!
          .pushNamed(MovieDetailScreen.route, arguments: item),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.greyD0D5DD,
            width: 1.0,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage(
              image: item.posterURL!,
              height: 80,
              width: 100,
              borderRadius: BorderRadius.circular(6),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                item.title ?? "",
                style: AppTextStyle.textMDmedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 12),
            InkWell(
              onTap: () => ref
                  .read(homeNotifierProvider.notifier)
                  .toggleFavourite(item.id!, !(item.isFavourite ?? false)),
              child: Container(
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      color: AppColors.greyD0D5DD,
                      blurRadius: 10,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  (item.isFavourite ?? false)
                      ? AppImages.favouriteFilled
                      : AppImages.favourite,
                  height: 20,
                  width: 20,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
