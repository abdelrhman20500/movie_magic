import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/data_sources/movie_remote_data_source.dart';
import '../../../data/repository/movies_repository.dart';
import '../../../domain/use_cases/get_movie_details_use_case.dart';
import '../../view_manger/movie_details/movie_details_cubit.dart';
import '../../view_manger/movie_details/movie_details_state.dart';
import 'build_item_movie_details.dart';

class BlocBuilderMovieDetails extends StatelessWidget {
  const BlocBuilderMovieDetails({super.key, required this.id,});

  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit(GetMovieDetailsUseCase(MoviesRepository(
        MovieRemoteDataSource(),),),)..getMovieDetails(movieId: id),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if(state is MovieDetailsLoading){
            const Center(child: CircularProgressIndicator());
          }else if(state is MovieDetailsFailure){
            // print(state.errMessage);
          }else if(state is MovieDetailsSuccess){
            return BuildItemMovieDetails(movieDetailsEntity: state.movieDetailsEntity,);
          }
          return Container();
        },
      ),
    );
  }
}

