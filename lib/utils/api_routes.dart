// Classe contenant tous les urls et chemins d'api de l'application
import 'package:flutter/foundation.dart';

class ApiRoutes {
  static const String baseUrl = 'http://197.244.214.251/Coriolis.RentCars.WebApi';
  static const String getUserbyEmail = '/api/users/email/';
  static const String login = '/api/token';
  static const String registration = '/api/users';
  static const String getUsers = '/api/users';

  static const String getVehicules = '/api/v1/vehicules';
  static const String getClients = '/api/v1/clients';
  static const String getReservations = '/api/v1/reservations';


}
