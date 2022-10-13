import 'package:fifa_book_app/app/core/rest/custom_dio.dart';
import 'package:fifa_book_app/app/pages/auth/login/login_page.dart';
import 'package:fifa_book_app/app/pages/auth/register/register_page.dart';
import 'package:fifa_book_app/app/pages/auth/register/register_route.dart';
import 'package:fifa_book_app/app/pages/home/home_page.dart';
import 'package:fifa_book_app/app/pages/splash/splash_route.dart';
import 'package:fifa_book_app/app/repository/auth/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'core/ui/theme/theme_config.dart';
import 'repository/auth/auth_repository.dart';

class FwcApp extends StatelessWidget {
  const FwcApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i()))
      ],
      child: MaterialApp(
        title: "Fifa World Cup Album",
        theme: ThemeConfig.theme,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashRoute(),
          '/auth/login': (context) => const LoginPage(),
          '/auth/register': (context) => const RegisterRoute(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
