 
import 'package:rent_car_dashboard/data/repositories/reservation_repository.dart';

class ReservationAnnulerUseCase {
  final ReservationRepository _reservationRepository;

  ReservationAnnulerUseCase(this._reservationRepository);

  Future<void> annulerReservation(String reservationId) async {
    await _reservationRepository.deleteReservation(reservationId);
  }
}
