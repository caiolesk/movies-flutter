import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/utils/status.dart';
import '../cubit/movie_details_cubit.dart';
import '../cubit/movie_details_state.dart';
import '../movie_details_module.dart';
import '../templates/movie_details_template.dart';

class MovieDetailsPage extends StatefulWidget {
  static const routeName = '/details';
  static const routePath = MovieDetailsModule.routePath + routeName;
  const MovieDetailsPage({super.key});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final MovieDetailsCubit cubit = Modular.get<MovieDetailsCubit>();
  @override
  void initState() {
    cubit.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        bloc: cubit,
        builder: (context, state) {
          return MovieDetailsTemplate(
            movie: state.movie,
            isLiked: state.isLiked,
            onLikeButtonTap: () {
              cubit.setLiked();
            },
            onErrorTap: () {
              cubit.fetchData();
            },
            similarMovies: state.similarMovies,
            isLoading: state.status.isLoading,
            isFailure: state.status.isFailure,
          );
        },
      ),
    );
  }
}
