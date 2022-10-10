import 'package:fifa_book_app/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'core/ui/theme/theme_config.dart';

class FwcApp extends StatelessWidget {
  const FwcApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fifa World Cup Album",
      theme: ThemeConfig.theme,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
      },
    );
  }
}
