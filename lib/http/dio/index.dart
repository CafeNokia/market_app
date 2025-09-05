import 'package:dio/dio.dart';

class CApiInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer token';
    print('sending request to: ${options.uri}');
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    print('status code: ${response.statusCode}');
    super.onResponse(response, handler);
  }

  @override
  onError(DioException e, ErrorInterceptorHandler handler) {
    String _errorMessage = '';
    if (e.type == DioExceptionType.connectionTimeout) {
      _errorMessage = 'network timeout...';
    } else if (e.type == DioExceptionType.receiveTimeout) {
      _errorMessage = 'received data timeout...';
    } else if (e.type == DioExceptionType.connectionError) {
      _errorMessage = 'network connected error...';
    } else {
      _errorMessage = 'request failed: ${e.message}';
    }
    print(_errorMessage);
    super.onError(e, handler);
  }
}

class CDioClient {
  static final _time = 10;
  CDioClient._internal();

  static final CDioClient _instance = CDioClient._internal();

  factory CDioClient() {
    return _instance;
  }

  late Dio _dio;

  void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:5001/',
        connectTimeout: Duration(seconds: _time),
        receiveTimeout: Duration(seconds: _time),
        sendTimeout: Duration(seconds: _time),
        // contentType: 'application/json',
        headers: {
          'Content-Type': 'application/json',
          // 'Accpet': 'application/json',
        }
      )
    );

    _dio.interceptors.add(CApiInterceptors());
  }

  Dio get dio => _dio;
}