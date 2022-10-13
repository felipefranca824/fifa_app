// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fifa_book_app/app/core/exceptions/repository_exception.dart';
import 'package:fifa_book_app/app/core/rest/custom_dio.dart';
import 'package:fifa_book_app/app/models/register_user_model.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;
  AuthRepositoryImpl({
    required this.dio,
  });
  @override
  Future<String> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> register(RegisterUserModel registerModel) async {
    try {
      await dio.unAuth().post(
            '/api/register',
            data: registerModel.toMap(),
          );
    } on DioError catch (e, s) {
      log("erro ao registrar usúario", error: e, stackTrace: s);
      throw RepositoryException(message: "erro ao registrar usúario");
    }
  }
}
