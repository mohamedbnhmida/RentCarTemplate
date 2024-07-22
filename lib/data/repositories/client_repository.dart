import 'package:rent_car_dashboard/data/models/client_list_model.dart';
import 'package:rent_car_dashboard/utils/api_routes.dart';
import 'package:dio/dio.dart'; 
import 'dart:async';

class ClientRepository {
  final Dio _dio;

  ClientRepository(String accessToken)
      : _dio = Dio(BaseOptions(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'accept': '*/*',
          },
        ));

  Future<List<Client>> consulterClient() async {
    try {
      final response = await _dio.get(ApiRoutes.getClients);
      if (response.data is List) {
        return (response.data as List)
            .map((vehicle) => Client.fromJson(vehicle))
            .toList();
      } else if (response.data['vehicles'] is List) {
        return (response.data['vehicles'] as List)
            .map((vehicle) => Client.fromJson(vehicle))
            .toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      throw Exception('Failed to load vehicles: $e');
    }
  }

  // Future<Client> ajouterClient(Client client) async {
  //   try {
  //     final response =
  //         await _dio.post(ApiRoutes.ajouterClient, data: client.toJson());
  //     return Client.fromJson(response.data);
  //   } catch (e) {
  //     throw Exception('Failed to add vehicle: $e');
  //   }
  // }

  // Future<Client> modifierClient(Client client) async {
  //   try {
  //     final response = await _dio.put(
  //         '${ApiRoutes.modifierClient}/${client.idClient}',
  //         data: client.toJson());
  //     return Client.fromJson(response.data);
  //   } catch (e) {
  //     throw Exception('Failed to update vehicle: $e');
  //   }
  // }

  // Future<void> supprimerClient(String clientId) async {
  //   try {
  //     await _dio.delete('${ApiRoutes.supprimerClient}/$clientId');
  //   } catch (e) {
  //     throw Exception('Failed to delete vehicle: $e');
  //   }
  // }
}
