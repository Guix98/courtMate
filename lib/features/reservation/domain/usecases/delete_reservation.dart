import 'package:court_mate/features/reservation/domain/repositories/reservation_repository.dart';

class DeleteReservation {
  final ReservationRespository repository;

  DeleteReservation({required this.repository});
  Future<void> call(int id) {
    return repository.deleteReservation(id);
  }
}
