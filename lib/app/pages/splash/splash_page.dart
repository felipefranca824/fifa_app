import 'package:fifa_book_app/app/core/ui/helpers/loader.dart';
import 'package:fifa_book_app/app/core/ui/helpers/messages.dart';
import 'package:fifa_book_app/app/core/ui/styles/button_styles.dart';
import 'package:fifa_book_app/app/core/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with Loader<SplashPage>, Messages<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Page'),
      ),
      body: Column(
        children: [
          Button.primary(
            label: 'Salvar',
            onPressed: () async {
              showLoader();
              await Future.delayed(Duration(seconds: 3));
              hideLoader();
            },
          ),
          Button.primary(
            label: 'teste 1',
            onPressed: () async {
              showError("Erro no botão");
            },
          ),

           Button.primary(
            label: 'teste 2',
            onPressed: () async {
              showSuccess("Erro no botão 2 ");
            },
          ),
           Button.primary(
            label: 'teste 3',
            onPressed: () async {
              showInfo("Erro no botão 3");
            },
          ),
        ],
      ),
    );
  }
}
