 
import 'package:rent_car_dashboard/data/models/user_save_model.dart';
import 'package:rent_car_dashboard/data/repositories/registration_repository.dart';

class RegistrationUseCase {
  final RegistrationRepository _registrationRepository = RegistrationRepository();

  Future<void> register(UserSaveModel user) {
    return _registrationRepository.register(user);
  }
}