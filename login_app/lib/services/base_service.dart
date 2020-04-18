import 'package:dio/dio.dart';

abstract class BaseService {
  BaseOptions options = BaseOptions(
    baseUrl: 'https://api.unsplash.com',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  get dio {
    return Dio(options);
  }
}
