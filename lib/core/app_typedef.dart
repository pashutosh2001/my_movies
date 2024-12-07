import 'package:dartz/dartz.dart';
import 'package:my_movies/core/network/api_error.dart';
import 'package:my_movies/core/network/api_response.dart';

typedef MapString = Map<String, String>;
typedef MapDynamic = Map<String, dynamic>;
typedef ApiDataResponse = Future<Either<ApiResponse, ApiError>>;
