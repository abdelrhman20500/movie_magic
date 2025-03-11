import 'package:dio/dio.dart';
import 'package:movie_magic/Core/error/server_exception.dart';
import 'package:movie_magic/Core/network/error_message_model.dart';
import 'package:movie_magic/Core/utils/app_constant.dart';
import 'package:movie_magic/Features/Movies/data/models/movie_details_model.dart';
import 'package:movie_magic/Features/Movies/data/models/movie_model.dart';
import 'package:movie_magic/Features/Movies/domain/use_cases/get_movie_details_use_case.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>>getNowPlayingMovies();
  Future<List<MovieModel>>getPopularMovies();
  Future<List<MovieModel>>getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameter);

}
class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
  Future<List<MovieModel>>getNowPlayingMovies() async {
    final response = await Dio().get(AppConstant.nowPlayingMoviesPath);
    // print(response);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(
          errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response=  await Dio().get(AppConstant.popularMoviesPath);
    // print(response);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(
          errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response=  await Dio().get(AppConstant.topRatedMoviesPath);
    // print(response);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(
          errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameter)async{
    final response=  await Dio().get(AppConstant.movieDetailsPath(parameter.movieId));
    // print(response);
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    }else{
      throw ServerException(
          errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }
  
}
