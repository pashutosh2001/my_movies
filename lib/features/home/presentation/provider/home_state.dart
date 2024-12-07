import 'package:my_movies/features/home/data/models/movies_model.dart';

class HomeState {
  bool isLoading;
  List<MoviesModel>? allMovies;
  String? apiError;
  String searchedQuery;

  HomeState({
    this.isLoading = false,
    this.allMovies,
    this.apiError,
    this.searchedQuery = "",
  });

  HomeState copWith({
    bool? isLoading,
    List<MoviesModel>? allMovies,
    String? apiError,
    String? searchedQuery,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      allMovies: allMovies ?? this.allMovies,
      apiError: apiError ?? this.apiError,
      searchedQuery: searchedQuery ?? this.searchedQuery,
    );
  }
}
