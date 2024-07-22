import 'dart:convert';
import 'dart:io'; 
import 'package:rent_car_dashboard/data/interceptors/authorization_interceptor.dart';
import 'package:rent_car_dashboard/data/interceptors/logger_interceptor.dart';
import 'package:rent_car_dashboard/data/models/token_model.dart';
import 'package:rent_car_dashboard/data/models/user_getbyemail_model.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:rent_car_dashboard/utils/app_variables.dart'; 
import 'package:dio/dio.dart';

import '../../utils/api_routes.dart'; 

class LoginRepository {
  LoginRepository()
      : _dio = Dio(
          BaseOptions(
            baseUrl: ApiRoutes.baseUrl,
            connectTimeout: AppConstants.connectionTimeout,
            receiveTimeout: AppConstants.receiveTimeout,
            responseType: ResponseType.json,
          ),
        )..interceptors.addAll([
            AuthorizationInterceptor(),
            LoggerInterceptor(),
          ]);

  late final Dio _dio;

  Future<User?> login(String email, String password) async {
    var data = json.encode({"email": email, "password": password});

    try {
      final response = await _dio.post(ApiRoutes.login, data: data);

      if (response.statusCode == 200) {
        TokenModel model = TokenModel.fromJson(response.data);
        if (model.succeeded) {

          AppVariables.authToken = model.data.token;
          AppVariables.refreshToken = model.data.refreshToken;
          
          User? user = await getUserConnecte(email);
          if(user == null )
            throw Exception('Login failed: User indefined !');
          return user;
        } else {
          throw Exception(
              'Login failed: ${response.data['messages'].join(', ')}');
        }
      } else {
        throw Exception('Failed to connect to the server');
      }
    } catch (e) {
      if (e is DioError) {
        if (e.error is SocketException) {
          print('Erreur de connexion réseau : ${e.error}');
        } else {
          print('Erreur Dio : ${e.message}');
        }
      } else {
        print('Erreur inattendue : $e');
      }
       throw Exception(e);
    }
}
  Future<User?> getUserConnecte(String email) async {
    User? user;

    _dio.options.headers['Authorization'] = 'Bearer ${AppVariables.authToken}';
    String url = '${ApiRoutes.getUserbyEmail}${email}';
    final response = await _dio.get(url);
  

    if (response.statusCode == 200) {
      UserbyEmailModel model = UserbyEmailModel.fromJson(response.data);

      if (model.succeeded) {
        user = model.data as User;
      }
    return user;
    }
  }
}