import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.options.baseUrl = dotenv.env['BASE_URL']!;
    dio.options.headers = {'accept': 'application/json'};

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    // dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) async {
    //       const storage = FlutterSecureStorage();
    //       final token = await storage.read(key: 'token');
    //       if (token != null) {
    //         options.headers['Authorization'] = 'Bearer $token';
    //       }
    //       return handler.next(options);
    //     },
    //   ),
    // );
  }

  // Requests
  Future<Response> getRequest({
    required String endpoint,
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.get(endpoint, queryParameters: queryParams);
  }

  Future<Response> postRequest({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    required dynamic data,
  }) async {
    return await dio.post(endpoint, data: data, queryParameters: queryParams);
  }

  Future<Response> updateRequest({
    required String endpoint,
    required dynamic data,
  }) async {
    return await dio.put(endpoint, data: data);
  }

  Future<Response> deleteRequest({
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    return await dio.delete(endpoint, data: data);
  }
}
