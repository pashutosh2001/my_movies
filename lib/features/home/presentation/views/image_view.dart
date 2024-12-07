import 'package:my_movies/core/extensions/context_extensions.dart';
import 'package:my_movies/core/utils/widgets/custom_network_image.dart';

import '../../../../core/utils/common_exports.dart';
import '../../../../core/utils/widgets/app_bar.dart';

class ImageView extends StatelessWidget {
  static const String route = "ImageView";
  final String posterURL;
  const ImageView({super.key, required this.posterURL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Image Preview",
        showLeading: false,
      ),
      body: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: CustomNetworkImage(
          image: posterURL,
          height: double.maxFinite,
          width: context.screenWidth,
          borderRadius: BorderRadius.zero,
        ),
      ),
    );
  }
}
