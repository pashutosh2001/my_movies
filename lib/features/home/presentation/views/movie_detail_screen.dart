import 'package:my_movies/core/extensions/context_extensions.dart';
import 'package:my_movies/core/routes/navigation_service.dart';
import 'package:my_movies/core/utils/widgets/custom_network_image.dart';
import 'package:my_movies/features/home/data/models/movies_model.dart';
import 'package:my_movies/features/home/presentation/views/image_view.dart';
import 'package:my_movies/features/home/presentation/widgets/movie_detail_info_row.dart';

import '../../../../core/utils/common_exports.dart';
import '../../../../core/utils/widgets/app_bar.dart';

class MovieDetailScreen extends StatelessWidget {
  static const String route = "MovieDetailScreen";
  final MoviesModel movie;
  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.movieDetail,
        showLeading: false,
      ),
      body: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => NavigationService.navigatorKey.currentState!
                      .pushNamed(ImageView.route, arguments: movie.posterURL),
                  child: CustomNetworkImage(
                    image: movie.posterURL!,
                    height: context.screenHeight * 0.56,
                    width: context.screenWidth,
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                const SizedBox(height: 16),
                MovieDetailInfoRow(
                  title: "Movie ID:",
                  value: movie.id.toString(),
                ),
                const SizedBox(height: 16),
                MovieDetailInfoRow(
                  title: "Movie Name:",
                  value: movie.title ?? "",
                ),
                const SizedBox(height: 16),
                MovieDetailInfoRow(
                  title: "IMDB ID:",
                  value: movie.imdbId ?? "",
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
