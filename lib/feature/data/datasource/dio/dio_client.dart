import 'package:dio/dio.dart';
import 'package:rick_morty/common/config.dart';

abstract class NetworkClient {
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });
}

class DioClient implements NetworkClient{
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = Config.host
      ..options.connectTimeout = Config.connectionTimeout
      ..options.receiveTimeout = Config.receiveTimeout
      ..options.responseType = ResponseType.json;
  }

  @override
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    {
      try {
        final Response response = await _dio.get(
          url,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
        return response;
      } catch (e) {
        rethrow;
      }
    }
  }
}
