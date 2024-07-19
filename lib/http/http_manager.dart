import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wan_giao_pro/http/request_api.dart';

import 'new_url_request.dart';

class HttpManager {
  static const int TIME_OUT = 30000;
  late Dio _dio;

  factory HttpManager() => _getInstance();
  static PersistCookieJar? _cookieJar;
  static HttpManager? _instance;

  static HttpManager get instance => _getInstance();
  bool isOpenProxy = false; //是否开启代理
  HttpManager._() {
    BaseOptions options = BaseOptions(
        baseUrl: RequestApi.HOST,
        sendTimeout: TIME_OUT,
        connectTimeout: TIME_OUT,
        receiveTimeout: TIME_OUT);
    _dio = Dio(options);
    _dio.interceptors.add(CookieManager(_cookieJar!));
    _dio!.interceptors.add(NewUrlRequest());
    if (isOpenProxy) {
      //dio.options.contentType = "text";
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.findProxy = (uri) {
          return "PROXY 192.168.2.135:8888"; //192.168.2.139为当前电脑的ip
        };
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
    if (kDebugMode) {
      _dio!.interceptors
          .add(LogInterceptor(request: true, responseBody: true, error: true));
    }
  }

  static HttpManager _getInstance() {
    return _instance ?? HttpManager._();
  }

  static Future initCookieJar() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath =
        appDocDir.path; //这个目录在Android中位于/data/data/your.package.name/files
    _cookieJar = new PersistCookieJar(storage: FileStorage(appDocPath));
  }

  static Future<void> clearCookie() async {
    await _cookieJar?.deleteAll();
  }

  /***
   * queryParams可以表示get请求的参数
   */
  Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParams,
      String newUrl = "",
      Options? option}) async {
    Response response;
    Options options = option ?? Options();
    options.extra = {"newUrl": newUrl};
    options.method = Method.GET;
    try {
      response =
          await _dio!.get(url, queryParameters: queryParams, options: options);
      if (response.statusCode == 200) {
        //妹子模块使用newUrl
        if (newUrl.isNotEmpty) {
          if (response.data['code'] != null && response.data['code'] == 1) {
            return response.data;
          } else {
            throw ResultException(response.data['code'], response.data['msg']);
          }
        }
        //妹子模块，图片保存
        if (url.isNotEmpty &&
            url.startsWith("http://power-api.cretinzp.com:8000")) {
          return response.data;
        }
        if (response.data['errorCode'] != null &&
                response.data['errorCode'] == 0 ||
            response.data['errorCode'] != null &&
                response.data['errorCode'] == 1) {
          return response.data;
        } else {
          throw ResultException(
              response.data['errorCode'], response.data['errorMsg']);
        }
      } else {
        throw ResultException(9007, "服务器失联了，呜呜呜呜");
      }
    } on DioError catch (e) {
      throw HttpDioError.handleError(e);
    }
  }

  Future<dynamic> post(String url,
      {Map<String, dynamic>? params, String newUrl = ""}) async {
    Response response;
    Options options = Options();
    options.extra = {"newUrl:": newUrl};
    options.method = Method.POST;
    try {
      response = await _dio!.post(url, data: params, options: options);
      if (response.statusCode == 200) {
        if (response.data['errorCode'] != null &&
                response.data['errorCode'] == 0 ||
            response.data['errorCode'] != null &&
                response.data['errorCode'] == 1) {
          return response.data;
        } else {
          throw ResultException(
              response.data['errorCode'], response.data['errorMsg']);
        }
      } else {
        throw ResultException(9007, "服务器失联了，呜呜呜呜");
      }
    } on DioError catch (e) {
      throw HttpDioError.handleError(e);
    }
  }

  Future postFormData(String url, Map<String, dynamic> params) async {
    try {
      Response response;
      response = await _dio.post(url, data: FormData.fromMap(params));
      if (response.statusCode == 200) {
        if (response.data['errorCode'] != null &&
                response.data['errorCode'] == 0 ||
            response.data['errorCode'] != null &&
                response.data['errorCode'] == 1) {
          return response.data;
        } else {
          throw ResultException(
              response.data['errorCode'], response.data['errorMsg']);
        }
      } else {
        throw ResultException(9007, "服务器失联了，呜呜呜呜");
      }
    } on DioError catch (e) {
      HttpDioError.handleError(e);
    }
  }

//  Future<dynamic>  request(String url, {Map<String, dynamic>? params, Map<String, dynamic>? queryParams,Options? options, String method = Method.GET, String newUrl = ""}) async {
//    Response response;
//    Options tempOptions=options??Options();
//    tempOptions.extra={"newUrl:":newUrl};
//    tempOptions.method=method;
//    try{
//      response = await _dio!.request(url,data: params, queryParameters: queryParams,options: options);
//      if(response.statusCode==200){
//        if(response.data['errorCode']!=null&&response.data['errorCode']==0||
//            response.data['errorCode']!=null&&response.data['errorCode']==1){
//          return response.data;
//        }else{
//          throw ResultException(response.data['code'], response.data['msg']);
//        }
//      }else{
//        throw ResultException(9007,"服务器失联了，呜呜呜呜");
//      }
//    } on DioError catch(e){
//      HttpDioError.handleError(e);
//    }
// }

}

class Method {
  static const GET = "get";
  static const POST = "post";
}

class HttpDioError {
  static const int LOGIN_CODE = -1001;

  static ResultException handleError(DioError dioError) {
    int code = 9006;
    String message = "未知错误";
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        code = 9000;
        message = "网络连接超时,请检查网络设置";
        break;
      case DioErrorType.receiveTimeout:
        code = 9001;
        message = "服务器异常，请稍后重试!";
        break;
      case DioErrorType.sendTimeout:
        code = 9002;
        message = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.response:
        code = 9003;
        message = "服务器异常，请稍后重试!";
        break;
      case DioErrorType.cancel:
        code = 9004;
        message = "请求已被取消,请重新请求";
        break;
      case DioErrorType.cancel:
        code = 9005;
        message = "网络异常，请稍后重试!";
        break;
      case DioErrorType.other:
        code = 9007;
        message = "网络异常，请稍后重试!!!";
        break;
    }
    return ResultException(code, message);
  }
}

class ResultException {
  final int code;
  final String message;

  ResultException(this.code, this.message);
}
