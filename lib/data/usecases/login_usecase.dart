 

//Changement

import 'package:rent_car_dashboard/data/models/user_getbyemail_model.dart';
import 'package:rent_car_dashboard/data/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository _loginRepository = LoginRepository();

  Future<User?> login(String email, String password) async {
    return await _loginRepository.login(email, password);
  }
}
