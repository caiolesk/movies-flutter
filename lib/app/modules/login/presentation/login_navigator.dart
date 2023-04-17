import 'package:flutter_modular/flutter_modular.dart';

import '../../movie_detail/presentation/pages/movie_details_page.dart';

class LoginNavigator {
  void openHome() {
    Modular.to.pushNamed(MovieDetailsPage.routePath);
  }
}
