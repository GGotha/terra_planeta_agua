import 'package:dio/dio.dart';

var options = BaseOptions(
  baseUrl: "https://jsonplaceholder.typicode.com",
);

Dio dio = Dio(options);
