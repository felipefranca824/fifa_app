import 'package:fifa_book_app/app/pages/auth/login/login_page.dart';
import 'package:fifa_book_app/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:fifa_book_app/app/pages/auth/login/presenter/login_presenter_impl.dart';
import 'package:fifa_book_app/app/services/login/login_service_impl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../../services/login/login_service.dart';

class LoginRoute extends FlutterGetItPageRoute {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<LoginService>(
          (i) => LoginServiceImpl(authRepository: i()),
        ),
        Bind.lazySingleton<LoginPresenter>(
          (i) => LoginPresenterImpl(loginService: i()),
        )
      ];
  @override
  WidgetBuilder get page => (context) => LoginPage(
        presenter: context.get(),
      );
}
