
import 'package:rent_car_dashboard/data/models/reservation_save_model.dart';
import 'package:rent_car_dashboard/utils/api_routes.dart'; 
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';


class ReservationRepository {
  static const String _reservationsKey = 'reservations';
  static const String _tokenKey = 'access_token'; // Key to store the access token

  Future<void> addReservation(ReservationSaveModel newReservation) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> reservationList = prefs.getStringList(_reservationsKey) ?? [];

      // Serialize reservation to JSON
      final reservationJson = newReservation.toJson();

      // Add reservation to list
      reservationList.add(jsonEncode(reservationJson));

      // Save updated list to SharedPreferences
      await prefs.setStringList(_reservationsKey, reservationList);

      // Get the access token from SharedPreferences
      String? accessToken = prefs.getString(_tokenKey);

      if (accessToken == null) {
        throw Exception('Access token not found');
      }

      // Save reservation remotely using Dio with access token
      Dio dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $accessToken';

      final response = await dio.post(
        ApiRoutes.getReservations,
        data: reservationJson,
      );

      print(response.data); // Handle response as needed

    } catch (e) {
      print('Error adding reservation: $e');
      rethrow; // Rethrow the exception for the caller to handle
    }
  }

  Future<List<ReservationSaveModel>> fetchReservations() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> reservationList = prefs.getStringList(_reservationsKey) ?? [];
      return reservationList
          .map((item) => ReservationSaveModel.fromJson(jsonDecode(item)))
          .toList();
    } catch (e) {
      print('Error fetching reservations: $e');
      rethrow; // Rethrow the exception for the caller to handle
    }
  }

  Future<void> updateReservation(ReservationSaveModel updatedReservation) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> reservationList = prefs.getStringList(_reservationsKey) ?? [];

      // Find index of the reservation to update
      int index = reservationList.indexWhere(
        (item) => ReservationSaveModel.fromJson(jsonDecode(item)).idReservation == updatedReservation.idReservation,
      );

      if (index != -1) {
        // Update reservation in the list
        reservationList[index] = jsonEncode(updatedReservation.toJson());

        // Save updated list to SharedPreferences
        await prefs.setStringList(_reservationsKey, reservationList);

        // Get the access token from SharedPreferences
        String? accessToken = prefs.getString(_tokenKey);

        if (accessToken == null) {
          throw Exception('Access token not found');
        }

        // Update reservation remotely using Dio with access token
        Dio dio = Dio();
        dio.options.headers['Authorization'] = 'Bearer $accessToken';

        final response = await dio.put(
          '${ApiRoutes.getReservations}/${updatedReservation.idReservation}',
          data: updatedReservation.toJson(),
        );

        print(response.data); // Handle response as needed
      } else {
        throw Exception('Reservation not found');
      }
    } catch (e) {
      print('Error updating reservation: $e');
      rethrow; // Rethrow the exception for the caller to handle
    }
  }

  Future<void> deleteReservation(String reservationId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> reservationList = prefs.getStringList(_reservationsKey) ?? [];
      reservationList.removeWhere((item) => ReservationSaveModel.fromJson(jsonDecode(item)).idReservation == reservationId);
      await prefs.setStringList(_reservationsKey, reservationList);

      // Get the access token from SharedPreferences
      String? accessToken = prefs.getString(_tokenKey);

      if (accessToken == null) {
        throw Exception('Access token not found');
      }

      // Delete reservation remotely using Dio with access token
      Dio dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $accessToken';

      final response = await dio.delete(
        '${ApiRoutes.getReservations}/$reservationId',
      );

      print(response.data); // Handle response as needed
    } catch (e) {
      print('Error deleting reservation: $e');
      rethrow; // Rethrow the exception for the caller to handle
    }
  }
}

