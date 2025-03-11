import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_magic/Core/error/failure.dart';
import 'package:movie_magic/Core/useCase/use_case.dart';
import 'package:movie_magic/Features/Movies/domain/entities/movie_details_entity.dart';
import 'package:movie_magic/Features/Movies/domain/repository/movie_repo.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetailsEntity, MovieDetailsParameters>{
  final MovieRepo movieRepo;

  GetMovieDetailsUseCase(this.movieRepo);
  @override
  Future<Either<Failure, MovieDetailsEntity>> call(MovieDetailsParameters parameters)async{
    return await movieRepo.getMovieDetails(parameter: parameters);
  }
}

/// i make this class because when i like send more parameters....
class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}