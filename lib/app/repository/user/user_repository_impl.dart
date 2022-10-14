// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fifa_book_app/app/core/exceptions/repository_exception.dart';
import 'package:fifa_book_app/app/core/rest/custom_dio.dart';
import 'package:fifa_book_app/app/models/user_model.dart';
import 'package:fifa_book_app/app/repository/user/user_repository.dart';
import 'package:flutter/services.dart';

class UserRepositoryImpl implements UserRepository {
  final CustomDio dio;
  UserRepositoryImpl({
    required this.dio,
  });
  @override
  Future<UserModel> getMe() async {
    try {
      final result = await dio.auth().get('/api/me');
      return UserModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log('Erro ao buscar os dados do usuário logado', error: e, stackTrace: s);
      throw RepositoryException(
          message: 'Erro ao buscar os dados do usuário logado');
    }
  }
}
