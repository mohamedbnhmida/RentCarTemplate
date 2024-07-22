import 'package:rent_car_dashboard/utils/app_variables.dart';
import 'package:dio/dio.dart'; 


 
 
    

//* Request methods PUT, POST, PATCH, DELETE needs access token,
//* which needs to be passed with "Authorization" header as Bearer token.
class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${AppVariables.authToken}';
    // if (_needAuthorizationHeader(options)) {
    //   options.headers['Authorization'] = 'Bearer ${AppVariables.authToken}';
    // }
    super.onRequest(options, handler);
  }

  // bool _needAuthorizationHeader(RequestOptions options) {
  //   if (options.method == 'GET') {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }
}