import 'package:fifa_book_app/app/core/ui/helpers/loader.dart';
import 'package:fifa_book_app/app/core/ui/helpers/messages.dart';
import 'package:fifa_book_app/app/models/user_model.dart';
import 'package:fifa_book_app/app/pages/home/home_page.dart';
import 'package:fifa_book_app/app/pages/home/view/home_view.dart';
import 'package:flutter/widgets.dart';

abstract class HomeViewImpl extends State<HomePage>
    with Loader<HomePage>, Messages<HomePage>
    implements HomeView {
  UserModel? user;
  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.presenter.getUser();
    });
    super.initState();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void logoutSucccess() {
    hideLoader();
    Navigator.pushNamedAndRemoveUntil(context, '/auth/login', (route) => false);
  }

  @override
  void setUser(UserModel user) {
    hideLoader();
    setState(() {
      this.user = user;
    });
  }
}
