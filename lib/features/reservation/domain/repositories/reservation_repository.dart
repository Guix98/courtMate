import 'package:court_mate/features/reservation/domain/entities/reservation.dart';

abstract class ReservationRespository {
  Future<List<Reservation>> getReservations();
  Future<void> addReservation(Reservation reservation);
  Future<void> deleteReservation(int index);
}
