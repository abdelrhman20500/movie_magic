import 'package:movie_magic/Features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_magic/Features/Movies/domain/repository/movie_repo.dart';

class GetNowPlayingUseCase{
  final MovieRepo movieRepo;

  GetNowPlayingUseCase(this.movieRepo);
 Future<List<MovieEntity>>call()async{
   return await movieRepo.getNowPlaying();
 }
}