import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_magic/Features/Movies/domain/use_cases/get_movie_recommendation_use_case.dart';
import 'package:movie_magic/Features/Movies/presentation/view_manger/movie_recommendation/movie_recommendation_state.dart';

class MovieRecommendationCubit extends Cubit<MovieRecommendationState> {
  MovieRecommendationCubit(this.getMovieRecommendationUseCase)
      : super(MovieRecommendationInitial());
  final GetMovieRecommendationUseCase getMovieRecommendationUseCase;
  void getMovieDetails({required int movieId}) async {
    emit(MovieRecommendationLoading());
    final result = await getMovieRecommendationUseCase
        .call(RecommendationParameters(movieId));
    result.fold((e) {
      emit(MovieRecommendationFailure(errMessage: e.message));
    }, (movie) {
      emit(MovieRecommendationSuccess(model: movie));
    });
  }
}
