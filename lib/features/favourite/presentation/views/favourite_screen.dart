import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_movies/core/di/service_locator.dart';
import 'package:my_movies/features/home/presentation/widgets/home_list_item.dart';

import '../../../../core/utils/common_exports.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(homeNotifierProvider);
    return data.allMovies!
            .where(
              (element) => (element.isFavourite ?? false) == true,
            )
            .toList()
            .isEmpty
        ? const Center(
            child: Text("No favourites available"),
          )
        : ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: data.allMovies!
                .where(
                  (element) => (element.isFavourite ?? false) == true,
                )
                .toList()
                .length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) => HomeListItem(
              item: data.allMovies!
                  .where(
                    (element) => (element.isFavourite ?? false) == true,
                  )
                  .toList()[index],
            ),
          );
  }
}
