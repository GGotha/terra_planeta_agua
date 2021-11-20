import 'package:dio/dio.dart';

var options = BaseOptions(
  baseUrl: "https://glacial-anchorage-46376.herokuapp.com/api/v1/sdg/",
);

Dio dio = Dio(options);
