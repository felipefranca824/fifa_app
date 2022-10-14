import 'package:fifa_book_app/app/core/mvp/fwc_presenter.dart';
import 'package:fifa_book_app/app/pages/home/view/home_view.dart';

abstract class HomePresenter extends FwcPresenter<HomeView> {
  Future<void> getUser();
  Future<void> logout();
}
