import 'package:court_mate/core/error/failures.dart';
import 'package:court_mate/features/reservation/domain/entities/reservation.dart';
import 'package:court_mate/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:dartz/dartz.dart';

class GetReservations {
  final ReservationRespository repository;

  GetReservations({required this.repository});
  Future<Either<Failure, List<Reservation>>> call() {
    return repository.getReservations();
  }
}
