import 'package:dio/dio.dart';
import 'package:fifa_book_app/app/core/ui/global/global_context.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await SharedPreferences.getInstance()
        .then((value) => value.getString('accessToken'));
    options.headers['Authorization'] = 'Bearer $accessToken';
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      Injector.get<GlobalContext>().loginExpire();
    } else {
      handler.next(err);
    }
  }
}
