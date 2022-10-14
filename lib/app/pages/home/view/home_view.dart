import 'package:fifa_book_app/app/models/user_model.dart';

abstract class HomeView {
  void setUser(UserModel user);
  void error(String message);
  void showLoader();
  void logoutSucccess();
  
}
