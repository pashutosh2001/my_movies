import 'package:my_movies/core/utils/common_exports.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final double height;
  final double width;
  final double radius;

  const AppShimmer({
    super.key,
    required this.height,
    required this.width,
    this.radius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyD0D5DD.withOpacity(0.5),
      highlightColor: AppColors.greyD0D5DD.withOpacity(0.2),
      direction: ShimmerDirection.ltr,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.grey5D667B,
          border: Border.all(
            width: 1,
            color: AppColors.grey344054,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
