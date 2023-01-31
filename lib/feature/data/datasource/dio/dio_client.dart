import 'package:dio/dio.dart';
import 'package:rick_morty/common/config.dart';
import 'package:rick_morty/feature/data/datasource/dio/dio_exception.dart';

abstract class NetworkClient {
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}

class DioClient implements NetworkClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = Config.host
      ..options.connectTimeout = Config.connectionTimeout
      ..options.receiveTimeout = Config.receiveTimeout
      ..options.responseType = ResponseType.json;
  }
  
  @override
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
