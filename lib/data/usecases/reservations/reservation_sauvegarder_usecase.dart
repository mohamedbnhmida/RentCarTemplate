 
import 'package:rent_car_dashboard/data/models/reservation_save_model.dart';
import 'package:rent_car_dashboard/data/repositories/reservation_repository.dart';

class ReservationSauvegarderUseCase {
  final ReservationRepository _reservationRepository;

  ReservationSauvegarderUseCase(this._reservationRepository);

  Future<void> addReservation(ReservationSaveModel newReservation) async {
    await _reservationRepository.addReservation(newReservation);
  }

  Future<List<ReservationSaveModel>> fetchReservations() async {
    return await _reservationRepository.fetchReservations();
  }

  Future<void> updateReservation(ReservationSaveModel updatedReservation) async {
    await _reservationRepository.updateReservation(updatedReservation);
  }

  Future<void> annulerReservation(String reservationId) async {
    await _reservationRepository.deleteReservation(reservationId);
  }
}
