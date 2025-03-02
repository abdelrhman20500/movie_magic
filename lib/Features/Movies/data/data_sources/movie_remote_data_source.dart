import 'package:dio/dio.dart';
import 'package:movie_magic/Core/error/server_exception.dart';
import 'package:movie_magic/Core/network/error_message_model.dart';
import 'package:movie_magic/Core/utils/app_constant.dart';
import 'package:movie_magic/Features/Movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>>getNowPlayingMovies();
  Future<List<MovieModel>>getPopularMovies();
  Future<List<MovieModel>>getTopRatedMovies();

}
class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
  Future<List<MovieModel>>getNowPlayingMovies() async {
    final response = await Dio().get(AppConstant.nowPlayingMoviesPath);
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
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(
          errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }
}
