import 'package:fifa_book_app/app/core/ui/helpers/loader.dart';
import 'package:fifa_book_app/app/core/ui/helpers/messages.dart';
import 'package:fifa_book_app/app/pages/auth/register/register_page.dart';
import 'package:fifa_book_app/app/pages/auth/register/view/register_view.dart';
import 'package:flutter/widgets.dart';

abstract class RegisterViewImpl extends State<RegisterPage>
    with Messages<RegisterPage>, Loader<RegisterPage>
    implements RegisterView {
  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void registerError([String? message]) {
    hideLoader();
    showError(message ?? "Erro ao cadastrar usuário");
  }

  @override
  void registerSuccess() {
    hideLoader();
    showSuccess("Usuário cadastrado com sucesso");
    Navigator.pop(context);
  }
}
