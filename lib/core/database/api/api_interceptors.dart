

import 'package:dio/dio.dart';

import '../../services/service_locator.dart';
import '../cache/cache_helper.dart';
import 'end_points.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
   options.headers[Apikeys.token] = sl<CacheHelper>().getData(key: Apikeys.token)
        != null
        ? 'FOODAPI ${sl<CacheHelper>().getData(key: Apikeys.token)}'
        : null;
     //options.headers[HttpHeaders.acceptHeader] = ContentType.json;
    

    super.onRequest(options, handler);
  }
}
