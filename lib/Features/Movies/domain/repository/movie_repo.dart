import 'package:dartz/dartz.dart';
import 'package:movie_magic/Features/Movies/domain/entities/movie_details_entity.dart';
import 'package:movie_magic/Features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_magic/Features/Movies/domain/entities/movie_recommendation_entity.dart';
import 'package:movie_magic/Features/Movies/domain/use_cases/get_movie_details_use_case.dart';
import '../../../../Core/error/failure.dart';
import '../use_cases/get_movie_recommendation_use_case.dart';

abstract class MovieRepo{
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({
   required MovieDetailsParameters parameter
});

  Future<Either<Failure, List<MovieRecommendationEntity>>> getMovieRecommendation({
    required RecommendationParameters parameter
  });
}