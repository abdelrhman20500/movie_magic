import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_magic/Core/error/failure.dart';
import 'package:movie_magic/Core/useCase/use_case.dart';
import 'package:movie_magic/Features/Movies/domain/entities/movie_recommendation_entity.dart';
import 'package:movie_magic/Features/Movies/domain/repository/movie_repo.dart';

class GetMovieRecommendationUseCase extends BaseUseCase<List<MovieRecommendationEntity>, RecommendationParameters>{

  final MovieRepo movieRepo;

  GetMovieRecommendationUseCase(this.movieRepo);

  @override
  Future<Either<Failure, List<MovieRecommendationEntity>>> call(RecommendationParameters parameters)async{
    return await movieRepo.getMovieRecommendation(parameter: parameters);
  }
}



class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}