import 'package:fifa_book_app/app/core/ui/helpers/loader.dart';
import 'package:fifa_book_app/app/pages/splash/splash_page.dart';
import 'package:fifa_book_app/app/pages/splash/view/splash_view.dart';
import 'package:flutter/widgets.dart';

abstract class SplashViewImpl extends State<SplashPage>
    with Loader<SplashPage>
    implements SplashView {
  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void logged(bool isLogged) {
    hideLoader();
    if (isLogged) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }
}
