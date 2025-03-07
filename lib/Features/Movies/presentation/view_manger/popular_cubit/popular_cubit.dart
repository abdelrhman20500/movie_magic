import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_magic/Features/Movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movie_magic/Features/Movies/presentation/view_manger/popular_cubit/popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit(this.getPopularMoviesUseCase) : super(PopularInitial());
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  void getPopular() async {
    emit(PopularLoading());
    final result = await getPopularMoviesUseCase.call();
    result.fold((e) {
      emit(PopularFailure(errMessage: e.message));
    }, (movie) {
      emit(PopularSuccess(movie: movie));
    });
  }
}
