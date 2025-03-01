import 'package:movie_magic/Features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_magic/Features/Movies/domain/repository/movie_repo.dart';

class GetTopRatedMoviesUseCase{
  final MovieRepo movieRepo;

  GetTopRatedMoviesUseCase(this.movieRepo);

  Future<List<MovieEntity>>call()async{
    return await movieRepo.getTopRatedMovies();
  }
}