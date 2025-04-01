import 'dart:developer';

import 'package:dio/dio.dart';
enum Methods {
  GET,POST,PUT,DELETE,PATCH,HEAD
}

class Request{
  static Request? _instance;
  factory Request() => _instance ?? Request._();
  Request get instance => _instance ?? Request._();
  Request._(){
    _instance = this;
    _dio = Dio(BaseOptions(
        baseUrl: "http://192.168.0.115:8080",
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5)
    ));
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequest,onError: _onError,onResponse: _onResponse
    ));
  }
  Dio _dio = Dio();


  final Map _methodValues = {
    Methods.GET: 'get',
    Methods.POST: 'post',
    Methods.PUT: 'put',
    Methods.DELETE: 'delete',
    Methods.PATCH: 'patch',
    Methods.HEAD: 'head'
  };

  /// 请求拦截器
  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 对非open的接口的请求参数全部增加userId
    if (!options.path.contains("open")) {
      options.queryParameters["userId"] = "xxx";
    }
    // 头部添加token
    // options.headers["token"] = "xxx";
    // 更多业务需求
    handler.next(options);
    // super.onRequest(options, handler);
  }

  /// 相应拦截器
  void _onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // 请求成功是对数据做基本处理
    if (response.statusCode == 200) {
      // 处理成功的响应
      // print("响应结果: $response");
    } else {
      // 处理异常结果
      print("响应异常: $response");
    }
    handler.next(response);
  }

  /// 错误处理: 网络错误等
  void _onError(DioException error, ErrorInterceptorHandler handler) {
    handler.next(error);
  }

  Future request(String path,
      {Methods methods = Methods.GET,
        Map<String, dynamic>? params,
        dynamic data,
        CancelToken? cancelToken,
        Options? options,
        Function(int,int)? onSendProgress,
        Function(int,int)? onReceiveProgress,
      })async{
    Options options = Options(method: _methodValues[methods]);
    try{
      var result = await _dio.request(
          path,queryParameters: params,data: data,options:options,
          cancelToken: cancelToken,onSendProgress: onSendProgress,onReceiveProgress:onReceiveProgress);
      return result.data;
    }on DioException catch(e){
      log("发送请求异常:$e");
      return null;
    }
  }

}