import 'package:dio/dio.dart';

class WacHttpClient {
  /// the one and only instance of this singleton
  static final WacHttpClient _instance = WacHttpClient._();
  late Dio _dio;

  WacHttpClient._() {
    _dio = Dio();
  }

  factory WacHttpClient() {
    return _instance;
  }

  Future<dynamic> post({urlPath, body, header, queryParameters}) async {
    try {
      print(body);
      Response response = await _dio.post(urlPath,
          data: body,
          queryParameters: queryParameters,
          options: Options());
      print(response);
      return response;
    } on DioError catch (e) {
      print(e);
      return e.response;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> get({urlPath, queryParameters, header}) async {
    try {
      Response response = await _dio.get(urlPath, queryParameters: queryParameters, options: Options(receiveDataWhenStatusError: true));
      print(response);
      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e.toString());
    }
  }

}