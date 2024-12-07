import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_movies/core/utils/common_exports.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String image;
  final double? height;
  final double width;
  final BorderRadius borderRadius;
  final bool showErrorText;
  final Alignment alignment;

  const CustomNetworkImage({
    super.key,
    required this.image,
    required this.height,
    required this.width,
    required this.borderRadius,
    this.showErrorText = true,
    this.alignment = Alignment.topCenter,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        width: width,
        height: height,
        alignment: alignment,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: const Color(0xff7E7E86).withOpacity(0.4),
          highlightColor: const Color(0xff7E7E86).withOpacity(0.1),
          direction: ShimmerDirection.ltr,
          child: Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          AppImages.imagePlaceholder,
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
