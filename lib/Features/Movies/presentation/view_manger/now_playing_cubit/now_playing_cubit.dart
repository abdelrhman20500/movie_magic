import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_magic/Core/useCase/use_case.dart';
import 'package:movie_magic/Features/Movies/domain/use_cases/get_now_playing_use_case.dart';
import 'package:movie_magic/Features/Movies/presentation/view_manger/now_playing_cubit/now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit(this.getNowPlayingUseCase) : super(NowPlayingInitial());
  final GetNowPlayingUseCase getNowPlayingUseCase;

  void getNowPlaying() async {
    emit(NowPlayingLoading());
    final result = await getNowPlayingUseCase.call(const NoParameters());
    result.fold((e) {
      emit(NowPlayingFailure(errMessage: e.message));
    }, (movie) {
      emit(NowPlayingSuccess(movie: movie));
    });
  }
}
