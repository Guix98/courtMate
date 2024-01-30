import 'package:court_mate/core/error/failures.dart';
import 'package:court_mate/features/reservation/domain/entities/reservation.dart';
import 'package:dartz/dartz.dart';

abstract class ReservationRespository {
  Future<Either<Failure, List<Reservation>>> getReservations();
  Future<void> addReservation(Reservation reservation);
  Future<void> deleteReservation(int id);
}
