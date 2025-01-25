import 'package:/dio/dio.dart';

class DioClass {
  static final DioClass _singleton = DioClass._internal();
  factory DioClass() {
    return _singleton;
  }
  DioClass._internal();
}
