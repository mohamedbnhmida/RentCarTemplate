 
import 'package:rent_car_dashboard/data/models/client_list_model.dart';
import 'package:rent_car_dashboard/data/repositories/client_repository.dart';

class ClientConsulterUsecase {
  final ClientRepository _clientRepository;
  ClientConsulterUsecase(this._clientRepository);

  Future<List<Client>> call() async {
    return await _clientRepository.consulterClient();
  }
}
