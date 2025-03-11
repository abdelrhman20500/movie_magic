import 'package:dartz/dartz.dart';
import 'package:movie_magic/Core/error/failure.dart';
import 'package:movie_magic/Features/Movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_magic/Features/Movies/domain/entities/movie_details_entity.dart';
import 'package:movie_magic/Features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_magic/Features/Movies/domain/entities/movie_recommendation_entity.dart';
import 'package:movie_magic/Features/Movies/domain/repository/movie_repo.dart';
import 'package:movie_magic/Features/Movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_magic/Features/Movies/domain/use_cases/get_movie_recommendation_use_case.dart';
import '../../../../Core/error/server_exception.dart';

class MoviesRepository extends MovieRepo{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);
  /// Now Playing Movies
  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies()async{
    try {
      final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  /// Popular Movies(
  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies()async{
    try {
      final result = await baseMovieRemoteDataSource.getPopularMovies();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  /// Top Rated Movies
  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies()async{
    try {
      final result = await baseMovieRemoteDataSource.getTopRatedMovies();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  /// Movie Details
  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({
    required MovieDetailsParameters parameter})async{
    try {
      final result = await baseMovieRemoteDataSource.getMovieDetails(parameter);
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
   /// Recommendation Movies
  @override
  Future<Either<Failure, List<MovieRecommendationEntity>>> getMovieRecommendation({required RecommendationParameters parameter})async{
    try {
      final result= await baseMovieRemoteDataSource.getMovieRecommendation(parameter);
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}