import 'package:dio/dio.dart';

class DioClass {
  static final DioClass _singleton = DioClass._internal();
  factory DioClass() {
    return _singleton;
  }
  DioClass._internal();

  getDioResponse(String filter, String noOfResults) async {
    var headers = {
      'Content-Type': 'application/json',
      'X-API-KEY':
          'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6ImFybjphd3M6a21zOnVzLWVhc3QtMjowMzczODQxMTc5ODQ6YWxpYXMvYjJjYWNlYWItQXV0aC1LZXkifQ.eyJlbnZpcm9ubWVudF9pZCI6ImE4YWM0ODg0LTI5NzMtNDk4ZC1hNThlLWZmYjg1ZmMyMzY0MSIsImdhdGV3YXlfaWQiOiJnd19iMmNhY2VhYi0yYTRlLTQ3YzYtOTlkZS1iNDM3M2I4NWE2MjIiLCJwb2xpY2llcyI6WyJSRUFEIiwiV1JJVEUiLCJVUERBVEUiLCJERUxFVEUiLCJDVVNUT00iXSwiaWF0IjoiMjAyNS0wMS0yMlQxMTowNToxNy44NzE5NzMzNjVaIiwianRpIjoiYjRjYTg5MTctZTNjNi00ZDYwLTk3NzMtNjE3OTRiYzg0NjNjIn0.tLWJRkCxDyT8dDKjher-nNXCy4HcZ-kA9Qobx0BviomZQyNqRplyvV95Wfc9tBZkUMG_7bl3lK_rAn258BpJFz2QLdGSOu0CO3wAz5UenZIMwioTzvsRBZp3_PFlmpurorDxm0WD8aTC-r2UP0lXFaCbLSjoSPDpK4oqXySSrNELpCTRQpHginRQY9YyTKIsVe6526zXTDQq9UTIEmGwJu_MH6FllSuXRWCt6INON8E2v5L7t_3VPUmthPVyKko_NcRP9vA0uJzWaZzX0P-nCOgglyB1kbThkWiUcaPme6KYcjq6EOCuj5z7odvBcBpw3NKZzJwTxB8jMOvZ9RjRQg',
      'Accept': 'application/json'
    };
    var dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 20);
    try {
      var response = await dio.request(
        'https://us-east-2.aws.neurelo.com/rest/user?filter=$filter&take=$noOfResults',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
        data: {},
      );

      //Document Details Receive
      //Map<String, dynamic> userDocument = response.data;
      //print(userDocument.toString());

      //If no Document Received Return with no value
      //if (userDocument.values.first == null) {
      //  return [null, null];
      //}
      //print(response.data);

      return ["1", response.data];
    } on Exception catch (error) {
      //print(error.toString() + "KKKK");
      return ["-1", error.toString()];
    }
  }
}
