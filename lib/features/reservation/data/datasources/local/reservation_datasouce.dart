import 'package:court_mate/features/reservation/data/models/reservation_model.dart';
import 'package:hive/hive.dart';

class ReservationDataSource {
  final Box<ReservationModel> reservationBox;

  ReservationDataSource({required this.reservationBox});

  List<ReservationModel> getReservations() {
    return reservationBox.values.toList();
  }

  void addReservation(ReservationModel reservation) {
    reservationBox.add(reservation);
  }

  void deleteReservation(int index) {
    reservationBox.delete(index);
  }
}
