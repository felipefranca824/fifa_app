// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:fifa_book_app/app/core/exceptions/unauthorized._exception.dart';
import 'package:fifa_book_app/app/pages/auth/login/view/login_view.dart';
import 'package:fifa_book_app/app/services/login/login_service.dart';

import 'login_presenter.dart';

class LoginPresenterImpl implements LoginPresenter {
  late final LoginView _view;

  final LoginService loginService;
  LoginPresenterImpl({
    required this.loginService,
  });
  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await loginService.execute(email: email, password: password);
      _view.success();
    } on UnauthorizedException {
      _view.error("Usuário ou senha inválidos");
    } catch (e, s) {
      log("erro ao realizar login", error: e, stackTrace: s);
      _view.error("Erro ao realizar login");
    }
  }

  @override
  set view(LoginView view) {
    _view = view;
  }
}
