import 'package:dio/dio.dart';
import 'package:hp_shop/contants/index.dart';

class DioRequest {
  final Dio _dio = Dio();
  DioRequest() {
    _dio.options.baseUrl = GlobalConstants.BASE_URL;
    _dio.options.connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    _dio.options.receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    _dio.options.sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    _dio.options.contentType = 'application/json';
    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! <= 300) {
            return handler.next(response);
          }
          // 其他状态码，抛出异常
          handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              message: response.data['message'] ?? '请求失败',
            ),
          );
        },
        onError: (error, handler) {
          // 其他异常，抛出异常
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              message: error.message ?? '请求失败',
            ),
          );
        },
      ),
    );
  }

  // get请求
  Future<dynamic> getURL(String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  // post请求
  Future<dynamic> postURL(String url, {Map<String, dynamic>? data}) {
    return _handleResponse(_dio.post(url, data: data));
  }

  Future<dynamic> _handleResponse(Future<dynamic> task) async {
    try {
      final response = await task;
      final data = response.data as Map<String, dynamic>;
      if (data['code'] == GlobalConstants.SUCCESS_CODE) {
        return data['result'];
      }
      throw Exception(data['message'] ?? '请求失败');
    } catch (e) {
      rethrow;
    }
  }
}

final dioRequest = DioRequest();
