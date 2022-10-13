// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:fifa_book_app/app/models/register_user_model.dart';
import 'package:fifa_book_app/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:fifa_book_app/app/pages/auth/register/view/register_view.dart';
import 'package:fifa_book_app/app/repository/auth/auth_repository.dart';

class RegisterPresenterImpl implements RegisterPresenter {
  late final RegisterView _view;

  final AuthRepository authRepository;
  RegisterPresenterImpl({
    required this.authRepository,
  });
  @override
  Future<void> register(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword}) async {
    final model = RegisterUserModel(
        name: name,
        email: email,
        password: password,
        confirmedPassword: confirmPassword);
    try {
      await authRepository.register(model);
      _view.registerSuccess();
    } catch (e, s) {
      log('Erro ao cadastrar usuário', error: e, stackTrace: s);
      _view.registerError();
    }
  }

  @override
  set view(RegisterView view) {
    _view = view;
  }
}
