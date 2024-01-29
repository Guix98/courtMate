import 'package:court_mate/features/reservation/domain/entities/reservation.dart';
import 'package:court_mate/features/reservation/domain/repositories/reservation_repository.dart';

class GetReservations {
  final ReservationRespository repository;

  GetReservations({required this.repository});
  Future<List<Reservation>> call() {
    return repository.getReservations();
  }
}
