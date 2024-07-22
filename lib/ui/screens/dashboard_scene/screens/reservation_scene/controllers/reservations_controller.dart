import 'package:rent_car_dashboard/data/models/reservation_save_model.dart';
import 'package:rent_car_dashboard/data/usecases/reservations/reservation_sauvegarder_usecase.dart';
import 'package:get/get.dart'; 
enum ReservationStatus { idle, loading, success, error }

class ReservationsController extends GetxController {
  final ReservationSauvegarderUseCase _reservationUseCase;

  
  RxList<ReservationSaveModel> reservations = <ReservationSaveModel>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  Rx<ReservationStatus> status = ReservationStatus.idle.obs;

  ReservationsController(this._reservationUseCase);

  @override
  void onInit() {
    super.onInit();
    fetchReservations(); 
  }

 
  Future<void> addReservation(ReservationSaveModel newReservation) async {
    try {
      isLoading.value = true;
      status.value = ReservationStatus.loading;

      await _reservationUseCase.addReservation(newReservation);

      reservations.add(newReservation);

      status.value = ReservationStatus.success;
    } catch (e) {
      _handleError(e);
    } finally {
      isLoading.value = false;
    }
  }

 
  Future<void> fetchReservations() async {
    try {
      isLoading.value = true;
      status.value = ReservationStatus.loading;

      final List<ReservationSaveModel> fetchedReservations = await _reservationUseCase.fetchReservations();

      reservations.assignAll(fetchedReservations);

      status.value = ReservationStatus.success;
    } catch (e) {
      _handleError(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteReservation(String reservationId) async {
    try {
      isLoading.value = true;
      status.value = ReservationStatus.loading;

      await _reservationUseCase.annulerReservation(reservationId);

      reservations.removeWhere((reservation) => reservation.idReservation == reservationId);

      status.value = ReservationStatus.success;
    } catch (e) {
      _handleError(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateReservation(ReservationSaveModel updatedReservation) async {
    try {
      isLoading.value = true;
      status.value = ReservationStatus.loading;

      await _reservationUseCase.updateReservation(updatedReservation);

      final index = reservations.indexWhere((reservation) => reservation.idReservation == updatedReservation.idReservation);
      if (index != -1) {
        reservations[index] = updatedReservation;
      }

      status.value = ReservationStatus.success;
    } catch (e) {
      _handleError(e);
    } finally {
      isLoading.value = false;
    }
  }

  void _handleError(dynamic e) {
    if (e is Error) {
      errorMessage.value = e.toString();
    } else {
      errorMessage.value = 'An error occurred';
    }
    status.value = ReservationStatus.error;
  }
}
