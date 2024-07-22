import 'package:rent_car_dashboard/data/interceptors/authorization_interceptor.dart';
import 'package:rent_car_dashboard/data/interceptors/logger_interceptor.dart';
import 'package:rent_car_dashboard/data/models/vehicule_list_model.dart';
import 'package:rent_car_dashboard/data/models/vehicule_save_model.dart';
import 'package:rent_car_dashboard/utils/api_routes.dart';
import 'package:rent_car_dashboard/utils/app_constants.dart';
import 'package:dio/dio.dart'; 

class VehiculeRepository {
  VehiculeRepository()
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

  Future<List<Vehicule>> consulterVehicules() async {
    
    try {

      final response = await _dio.get(ApiRoutes.getVehicules);

      if (response.statusCode == 200) {
        
        VehiculeListModel model = VehiculeListModel.fromJson(response.data);

        if (model.succeeded) {
          if (model.vehicules is List) {
            return (model.vehicules as List)
                .map((v) => Vehicule.fromJson(v))
                .toList();
          } else {
            throw Exception('Unexpected response format');
          }
        } else {
          throw Exception('Unexpected response format');
        }
      }
      else {
          throw Exception('Unexpected response format');
        }


    } catch (e) {
      throw Exception('Failed to load vehicles: $e');
    }
  }

  Future<VehiculeSaveModel> ajouterVehicule(VehiculeSaveModel vehicle) async {
    try {
      final response =
          await _dio.post(ApiRoutes.getVehicules, data: vehicle.toJson());
      return VehiculeSaveModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to add vehicle: $e');
    }
  }
}
