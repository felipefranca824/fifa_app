import 'package:fifa_book_app/app/core/styles/colors_app.dart';
import 'package:fifa_book_app/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Page'),
      ),
      body: Container(),
    );
  }
}
