import 'package:movie_magic/Features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_magic/Features/Movies/domain/repository/movie_repo.dart';

class GetPopularMoviesUseCase{
 final MovieRepo movieRepo;

  GetPopularMoviesUseCase(this.movieRepo);

  Future<List<MovieEntity>>call()async{
    return await movieRepo.getPopularMovies();
  }
}