import 'package:movie_magic/Features/Movies/domain/entities/movie_entity.dart';

abstract class NowPlayingState{}
class NowPlayingInitial extends NowPlayingState{}
class NowPlayingLoading extends NowPlayingState{}
class NowPlayingFailure extends NowPlayingState{
  final String errMessage;
  NowPlayingFailure({required this.errMessage});
}
class NowPlayingSuccess extends NowPlayingState{
  final List<MovieEntity> movie;

  NowPlayingSuccess({required this.movie});
}