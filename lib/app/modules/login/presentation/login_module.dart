import 'package:flutter_modular/flutter_modular.dart';

import '../../movie_detail/presentation/movie_details_module.dart';
import '../data/datasources/login_data_source.dart';
import '../data/repositories/login_repository_impl.dart';
import '../domain/usecases/get_users_profiles_use_case.dart';
import '../domain/usecases/save_user_profile_use_case.dart';
import 'cubit/login_cubit.dart';
import 'login_navigator.dart';
import 'pages/login_page.dart';

class LoginModule extends Module {
  static const routeName = '/login-module';
  static const routePath = routeName;

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => LoginDataSourceImpl()),
        Bind((i) => LoginRepositoryImpl(dataSource: i())),
        Bind((i) => GetUsersProfilesUseCase(repository: i())),
        Bind((i) => SaveUserProfileUseCase(repository: i())),
        Bind((i) => LoginNavigator()),
        Bind(
          (i) => LoginCubit(
            getUsersProfilesUseCase: i(),
            saveUserProfileUseCase: i(),
            loginNavigator: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const LoginPage(),
        ),
        ModuleRoute(
          MovieDetailsModule.routeName,
          module: MovieDetailsModule(),
        ),
      ];
}
