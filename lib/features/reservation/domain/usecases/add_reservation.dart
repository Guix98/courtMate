import 'package:court_mate/features/reservation/domain/entities/reservation.dart';
import 'package:court_mate/features/reservation/domain/repositories/reservation_repository.dart';

class AddReservation {
  final ReservationRespository repository;

  AddReservation({required this.repository});
  Future<void> call(Reservation reservation) {
    return repository.addReservation(reservation);
  }
}
