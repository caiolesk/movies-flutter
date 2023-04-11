import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/utils/status.dart';
import '../cubit/movie_details_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../cubit/movie_details_state.dart';

class MovieDetailsPage extends StatefulWidget {
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
      appBar: AppBar(),
      body: BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
        bloc: cubit,
        builder: (context, state) {
          if (state.status.isLoading) return CircularProgressIndicator();
          return Container();
        },
        listener: (context, state) {},
      ),
    );
  }
}
