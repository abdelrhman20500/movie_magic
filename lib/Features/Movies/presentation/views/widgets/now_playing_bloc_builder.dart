import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_magic/Features/Movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_magic/Features/Movies/data/repository/movies_repository.dart';
import 'package:movie_magic/Features/Movies/domain/use_cases/get_now_playing_use_case.dart';
import 'package:movie_magic/Features/Movies/presentation/view_manger/now_playing_cubit/now_playing_cubit.dart';
import 'package:movie_magic/Features/Movies/presentation/view_manger/now_playing_cubit/now_playing_state.dart';
import 'now_playing_component.dart';

class NowPlayingBlocBuilder extends StatelessWidget {
  const NowPlayingBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingCubit(GetNowPlayingUseCase(MoviesRepository(MovieRemoteDataSource())))..getNowPlaying(),
      child: BlocBuilder<NowPlayingCubit, NowPlayingState>(

        builder: (context, state) {
          if (state is NowPlayingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NowPlayingFailure) {
            return Center(child: Text('Error: ${state.errMessage}'));
          } else if (state is NowPlayingSuccess) {
            return NewWidget(model: state.movie); // Pass the movie list to NewWidget
          }
          return Container();
        },
      ),
    );
  }
}

