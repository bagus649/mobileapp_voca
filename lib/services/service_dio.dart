// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';

Future<Dio> apiCall([String? token]) async {
  var _dio = Dio();
  // ByteData bytes = await rootBundle.load('assets/certificate/vocagame-com.pem');

  _dio
    ..options.baseUrl = 'https://api-staging.vocagame.com/v1/'
    ..options.headers["Content-Type"] = "application/json"
    ..options.headers["X-Client"] = "mobile"
    ..options.connectTimeout = 60 * 2000;

  // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //     (client) {
  //   SecurityContext sc = SecurityContext();
  //   sc.setTrustedCertificatesBytes(bytes.buffer.asUint8List());
  //   HttpClient httpClient = HttpClient(context: sc);
  //   return httpClient;
  // };

  if (token != null) {
    _dio.options.headers['authorization'] = 'Bearer $token';
  }

  return _dio;
}
