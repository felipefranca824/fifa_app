import 'package:fifa_book_app/app/pages/splash/presenter/splash_presenter.dart';
import 'package:fifa_book_app/app/pages/splash/view/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPresenterImpl implements SplashPresenter {
  late final SplashView _view;
  @override
  Future<void> checkLogin() async {
    _view.showLoader();
    final accessToken = await SharedPreferences.getInstance()
        .then((value) => value.getString('accessToken'));

    _view.logged(accessToken != null);
  }

  @override
  set view(view) {
    _view = view;
  }
}
