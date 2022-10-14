import 'package:fifa_book_app/app/core/mvp/fwc_presenter.dart';
import 'package:fifa_book_app/app/pages/auth/login/view/login_view.dart';

abstract class LoginPresenter extends FwcPresenter<LoginView> {
  void login({required String email, required String password});
}
