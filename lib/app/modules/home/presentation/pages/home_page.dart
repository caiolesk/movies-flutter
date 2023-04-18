import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/utils/status.dart';
import '../../home_module.dart';
import '../cubits/home_cubit.dart';
import '../cubits/home_state.dart';
import '../templates/home_template.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  static const routePath = HomeModule.routePath + routeName;
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeCubit cubit = Modular.get();

  @override
  void initState() {
    cubit.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (context, state) {
        return HomeTemplate(
          onMovieClick: cubit.openMovieDetails,
          isLoading: state.status.isLoading,
          listNowPlaying: state.listNowPlaying,
          listPopular: state.listPopular,
          listTopRated: state.listTopRated,
          listUpComing: state.listUpComing,
        );
      },
      listener: (context, state) {
        if (state.status.isFailure) {
          Fluttertoast.showToast(
            msg: "Erro",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      listenWhen: (previous, current) => previous.failure != current.failure,
    );
  }
}
