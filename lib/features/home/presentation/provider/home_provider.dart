import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:my_movies/core/di/service_locator.dart';
import 'package:my_movies/features/home/data/models/movies_model.dart';
import 'package:my_movies/features/home/data/repositories/home_repository_imp.dart';
import 'package:my_movies/features/home/presentation/provider/home_state.dart';

class HomeNotifierProvider extends StateNotifier<HomeState> {
  HomeNotifierProvider(this.ref) : super(HomeState()) {
    _homeRepositoryImp = HomeRepositoryImp(ref.read(apiClientProvider));
    searchController = TextEditingController();
    searchFocusNode = FocusNode();
    checkNetwork();
  }

  late HomeRepositoryImp _homeRepositoryImp;

  late final Ref<HomeState> ref;

  late TextEditingController searchController;
  late FocusNode searchFocusNode;

  Future<void> allMoviesApiCall() async {
    final res = await _homeRepositoryImp.allMovies();
    res.fold(
      (data) async {
        log(data.data.toString());
        final decodedResponse = json.decode(data.data.body);

        List<MoviesModel> movies = (decodedResponse as List)
            .map(
              (item) => MoviesModel.fromJson(item),
            )
            .toList();
        await setDataToHive(movies);
        state = state.copWith(
          allMovies: movies,
          isLoading: false,
        );
      },
      (err) {
        state = state.copWith(
          apiError: err.message ?? "Error",
          isLoading: false,
        );
        log(err.message.toString());
      },
    );
  }

  checkNetwork() async {
    state = state.copWith(isLoading: true);
    List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if ((connectivityResult.first == ConnectivityResult.mobile) ||
        (connectivityResult.first == ConnectivityResult.wifi)) {
      await allMoviesApiCall();
    } else {
      bool boxExists = await Hive.boxExists("allMovies");
      if (boxExists) {
        Box<dynamic> movieBox = await Hive.openBox("allMovies");
        log(movieBox.runtimeType.toString());
        List<MoviesModel> allMovies =
            List<MoviesModel>.from(movieBox.values.toList()[0]);
        state = state.copWith(
          allMovies: allMovies,
          isLoading: false,
        );
      } else {
        log("No local data");
        state.copWith(
          apiError: "No internet connection",
          isLoading: false,
        );
      }
    }
  }

  Future<void> setDataToHive(List<MoviesModel> movies) async {
    bool boxExists = await Hive.boxExists("allMovies");
    if (boxExists) {
      await Hive.deleteBoxFromDisk("allMovies");
    }
    Box<dynamic> movieBox = await Hive.openBox("allMovies");
    await movieBox.add(movies);
  }

  void toggleFavourite(int id, bool markFavourite) {
    state.allMovies!.firstWhere((element) => element.id == id).isFavourite =
        markFavourite;

    state = state.copWith(allMovies: state.allMovies);
  }

  setSearchedQuery(String query) {
    state = state.copWith(searchedQuery: query);
  }
}
