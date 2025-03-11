import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_magic/Core/useCase/use_case.dart';
import 'package:movie_magic/Features/Movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import 'package:movie_magic/Features/Movies/presentation/view_manger/top_rated_cubit/top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit(this.getTopRatedMoviesUseCase) : super(TopRatedInitial());
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  void getTopRated() async {
    emit(TopRatedLoading());
    final result = await getTopRatedMoviesUseCase.call(const NoParameters());
    result.fold((e) {
      emit(TopRatedFailure(errMessage: e.message));
    }, (movie) {
      emit(TopRatedSuccess(movie: movie));
    });
  }
}
