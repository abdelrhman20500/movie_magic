import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_magic/Features/Movies/domain/use_cases/get_movie_recommendation_use_case.dart';
import 'package:movie_magic/Features/Movies/presentation/view_manger/movie_recommendation/movie_recommendation_cubit.dart';
import 'package:movie_magic/Features/Movies/presentation/view_manger/movie_recommendation/movie_recommendation_state.dart';
import 'package:movie_magic/Features/Movies/presentation/views/widgets/build_grid_view_recommendation.dart';
import '../../../data/data_sources/movie_remote_data_source.dart';
import '../../../data/repository/movies_repository.dart';

class BlocBuilderMoviesRecommendation extends StatelessWidget {
  const BlocBuilderMoviesRecommendation({super.key, required this.id,});

  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieRecommendationCubit(GetMovieRecommendationUseCase(MoviesRepository(
        MovieRemoteDataSource(),
      ),),)..getMovieRecommendation(movieId: id),
      child: BlocBuilder<MovieRecommendationCubit, MovieRecommendationState>(
        builder: (context, state) {
          if(state is MovieRecommendationLoading){
            const Center(child: CircularProgressIndicator());
          }else if(state is MovieRecommendationFailure){
            // print(state.errMessage);
          }else if(state is MovieRecommendationSuccess){
            return BuildGridViewRecommendation(model: state.model,);
          }
          return Container();
        },
      ),
    );
  }
}

