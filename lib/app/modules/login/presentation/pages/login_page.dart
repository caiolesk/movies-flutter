import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/utils/status.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import '../login_module.dart';
import '../templates/login_template.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  static const routePath = LoginModule.routePath + routeName;
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginCubit cubit = Modular.get();

  @override
  void initState() {
    super.initState();
    cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: cubit,
      builder: (context, state) {
        return LoginTemplate(
          listUsersProfiles: state.usersProfiles ?? [],
          isLoading: state.status.isLoading,
          onProfileClick: cubit.onProfileClick,
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
      listenWhen: (previous, current) => previous.status != current.status,
    );
  }
}
