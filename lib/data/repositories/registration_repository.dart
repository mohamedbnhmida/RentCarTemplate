import 'package:rent_car_dashboard/data/models/user_save_model.dart';
import 'package:rent_car_dashboard/utils/api_routes.dart'; 
import 'package:dio/dio.dart';

class RegistrationRepository {
  final Dio _dio = Dio();

  Future<void> register(UserSaveModel user) async {
    try {
      final response = await _dio.post(
        ApiRoutes.registration,
        data: user.toJson(), 
      );
      if (response.statusCode == 200) {
        if (response.data['succeeded']){
        return response.data['messages']?.join(', ') ?? 'User registered successfully';
      } else {
          throw Exception('Login failed: ${response.data['messages'].join(', ')}');
      }
      } else{throw Exception('Failed to connect to the server');}
    } catch (e) {
      throw Exception('the following error occured $e');
    }
  }
}