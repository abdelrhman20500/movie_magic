
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_magic/Features/Movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_magic/Features/Movies/data/repository/movies_repository.dart';
import 'package:movie_magic/Features/Movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import 'package:movie_magic/Features/Movies/presentation/view_manger/top_rated_cubit/top_rated_cubit.dart';
import 'package:movie_magic/Features/Movies/presentation/view_manger/top_rated_cubit/top_rated_state.dart';
import 'package:movie_magic/Features/Movies/presentation/views/widgets/top_rated_list_view.dart';


class TopRatedBlocBuilder extends StatelessWidget {
  const TopRatedBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopRatedCubit(GetTopRatedMoviesUseCase(MoviesRepository(MovieRemoteDataSource(),),),
      )..getTopRated(),
      child: BlocBuilder<TopRatedCubit,TopRatedState>(
        builder: (context, state) {
          if(state is TopRatedLoading){
            const Center(child: CircularProgressIndicator(),);
          }else if(state is TopRatedFailure){
            // print(state.errMessage);
          }else if(state is TopRatedSuccess){
            return TopRatedListView(model: state.movie,);
          }
          return Container();
        },
      ),
    );
  }
}


