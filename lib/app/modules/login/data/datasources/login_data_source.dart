import '../../../shared/data/errors/failures.dart';
import '../../domain/entities/user.dart';
import '../models/user_model.dart';

abstract class LoginDataSource {
  Future<List<User>> getUsersProfiles();
  Future<void> saveUserProfile(User user);
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<List<User>> getUsersProfiles() async {
    try {
      await Future.delayed(const Duration(seconds: 3));

      return [
        UserModel(
          name: 'John',
          imagePath: 'assets/images/john.png',
        ),
        UserModel(
          name: 'Mike',
          imagePath: 'assets/images/mike.png',
        ),
        UserModel(
          name: 'Helina',
          imagePath: 'assets/images/helina.png',
        ),
        UserModel(
          name: 'Kids',
          imagePath: 'assets/images/kids.png',
        ),
      ];
    } catch (e) {
      throw ParseDataException(e.toString());
    }
  }

  @override
  Future<void> saveUserProfile(User user) async {
    try {
      //todo save selected profile user
    } catch (e) {
      throw ParseDataException(e.toString());
    }
  }
}
