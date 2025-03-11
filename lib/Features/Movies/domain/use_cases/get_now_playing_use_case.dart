import 'package:dartz/dartz.dart';
import 'package:movie_magic/Core/useCase/use_case.dart';
import 'package:movie_magic/Features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_magic/Features/Movies/domain/repository/movie_repo.dart';
import '../../../../Core/error/failure.dart';

class GetNowPlayingUseCase extends BaseUseCase<List<MovieEntity>, NoParameters>{
  final MovieRepo movieRepo;

  GetNowPlayingUseCase(this.movieRepo);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParameters parameters)async{
      return await movieRepo.getNowPlayingMovies();
 }
}