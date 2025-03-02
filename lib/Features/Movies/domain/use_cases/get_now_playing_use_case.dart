import 'package:dartz/dartz.dart';
import 'package:movie_magic/Features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_magic/Features/Movies/domain/repository/movie_repo.dart';
import '../../../../Core/error/failure.dart';

class GetNowPlayingUseCase{
  final MovieRepo movieRepo;

  GetNowPlayingUseCase(this.movieRepo);
  Future<Either<Failure, List<MovieEntity>>>call()async{
   return await movieRepo.getNowPlayingMovies();
 }
}