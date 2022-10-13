// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fifa_book_app/app/pages/auth/register/view/register_view_impl.dart';
import 'package:flutter/material.dart';

import 'package:fifa_book_app/app/core/ui/styles/text_styles.dart';
import 'package:fifa_book_app/app/core/ui/widgets/button.dart';
import 'package:fifa_book_app/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  final RegisterPresenter presenter;
  const RegisterPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 106.82,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bola.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Cadastrar Usuário',
                style: context.textStyles.titleBlack,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameEC,
                      validator: Validatorless.required("Obrigatório"),
                      decoration: const InputDecoration(
                        label: Text("Nome completo *"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required("Obrigatório"),
                        Validatorless.email("Email inválido")
                      ]),
                      decoration: const InputDecoration(
                        label: Text("Email *"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: passwordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required("Obrigatório"),
                        Validatorless.min(
                            6, "Senha deve conter pelo menos 6 caracteres"),
                      ]),
                      decoration: const InputDecoration(
                        label: Text("Senha *"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: confirmPasswordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required("Obrigatório"),
                        Validatorless.min(
                            6, "Senha deve conter pelo menos 6 caracteres"),
                        Validatorless.compare(
                            passwordEC, 'Senhas não conferem'),
                      ]),
                      decoration: const InputDecoration(
                        label: Text("Confirmar senha *"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Button.primary(
                      label: 'Cadastrar',
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          widget.presenter.register(
                            name: nameEC.text,
                            email: emailEC.text,
                            password: passwordEC.text,
                            confirmPassword: confirmPasswordEC.text,
                          );
                        }
                      },
                      width: size.width * 0.9,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
