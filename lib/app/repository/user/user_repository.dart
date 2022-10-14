import 'package:fifa_book_app/app/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getMe();
}
