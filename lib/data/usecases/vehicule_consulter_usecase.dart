 
import 'package:rent_car_dashboard/data/models/vehicule_list_model.dart';
import 'package:rent_car_dashboard/data/repositories/vehicule_repository.dart';

class VehiculeConsulterUseCase {
  final VehiculeRepository _vehicleRepository = VehiculeRepository();

  Future<List<Vehicule>> consulterVehicules() async {
    return await _vehicleRepository.consulterVehicules();
  }
}
