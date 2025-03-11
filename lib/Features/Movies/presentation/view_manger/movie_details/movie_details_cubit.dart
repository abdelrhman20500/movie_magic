import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_magic/Features/Movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_magic/Features/Movies/presentation/view_manger/movie_details/movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.getMovieDetailsUseCase) : super(MovieDetailsInitial());
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  void getMovieDetails({required int movieId}) async {
    emit(MovieDetailsLoading());
    final result = await getMovieDetailsUseCase
        .call(MovieDetailsParameters(movieId: movieId));
    result.fold((e) {
      emit(MovieDetailsFailure(errMessage: e.message));
    }, (movieDetails) {
      emit(MovieDetailsSuccess(movieDetailsEntity: movieDetails));
    });
  }
}
