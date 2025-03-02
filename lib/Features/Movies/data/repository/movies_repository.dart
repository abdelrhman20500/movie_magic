import 'package:dartz/dartz.dart';
import 'package:movie_magic/Core/error/failure.dart';
import 'package:movie_magic/Features/Movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_magic/Features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_magic/Features/Movies/domain/repository/movie_repo.dart';

import '../../../../Core/error/server_exception.dart';

class MoviesRepository extends MovieRepo{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository({required this.baseMovieRemoteDataSource});
  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies()async{
    try {
      final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies()async{
    try {
      final result = await baseMovieRemoteDataSource.getPopularMovies();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies()async{
    try {
      final result = await baseMovieRemoteDataSource.getTopRatedMovies();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}