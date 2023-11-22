import 'package:better_call_saul_app/core/utils/constants/Strings.dart';
import 'package:dio/dio.dart';

class ApiService {
  late final Dio _dio;

  ApiService() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
    _dio = Dio(baseOptions);
  }

  Future<Response> getData({
    required String endPoint,
  }) async {
    return await _dio.get(endPoint);
  }
}
