// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fifa_book_app/app/pages/home/presenter/home_presenter.dart';
import 'package:fifa_book_app/app/pages/home/view/home_view.dart';
import 'package:fifa_book_app/app/repository/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePresenterImpl implements HomePresenter {
  late final HomeView _view;
  final UserRepository userRepository;
  HomePresenterImpl({
    required this.userRepository,
  });
  @override
  Future<void> getUser() async {
    try {
      _view.showLoader();
      final result = await userRepository.getMe();
      _view.setUser(result);
    } catch (e) {
      _view.error('Erro ao buscar os dados do usuário');
    }
  }

  @override
  Future<void> logout() async {
    await SharedPreferences.getInstance().then((value) => value.clear());
    _view.logoutSucccess();
  }

  @override
  set view(HomeView view) {
    _view = view;
  }
}
