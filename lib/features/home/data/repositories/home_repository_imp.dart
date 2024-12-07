import 'package:dartz/dartz.dart';
import 'package:my_movies/features/home/domain/repositories/home_repository.dart';

import '../../../../core/app_typedef.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_error.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/api_url.dart';

class HomeRepositoryImp implements HomeRepository {
  final ApiClient _apiClient;

  HomeRepositoryImp(this._apiClient);

  @override
  ApiDataResponse allMovies() async {
    try {
      final response = await _apiClient.get(ApiUrl.movies);
      return Left(ApiResponse.completed(response));
    } catch (e) {
      return Right(ApiError(message: e.toString()));
    }
  }
}
