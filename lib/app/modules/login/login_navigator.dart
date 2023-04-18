import 'package:flutter_modular/flutter_modular.dart';

import '../home/presentation/pages/home_page.dart';

class LoginNavigator {
  void openHome() {
    Modular.to.pushNamed(HomePage.routePath);
  }
}
