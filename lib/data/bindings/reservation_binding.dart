import 'package:rent_car_dashboard/data/repositories/reservation_repository.dart';
import 'package:rent_car_dashboard/data/usecases/reservations/reservation_sauvegarder_usecase.dart';
import 'package:rent_car_dashboard/ui/screens/dashboard_scene/screens/reservation_scene/controllers/reservations_controller.dart';
import 'package:get/get.dart';
 
class ReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservationRepository>(() => ReservationRepository());


    Get.lazyPut<ReservationSauvegarderUseCase>(
        () => ReservationSauvegarderUseCase(Get.find<ReservationRepository>()));

        
    Get.lazyPut<ReservationsController>(
        () => ReservationsController(Get.find<ReservationSauvegarderUseCase>()));
  }
}
