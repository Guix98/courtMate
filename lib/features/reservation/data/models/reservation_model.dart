import 'package:court_mate/features/reservation/domain/entities/reservation.dart';
import 'package:hive/hive.dart';

part 'reservation_model.g.dart';

@HiveType(typeId: 0)
class ReservationModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String court;
  @HiveField(2)
  final DateTime date;

  ReservationModel(
      {required this.name, required this.court, required this.date});

  factory ReservationModel.fromEntity(Reservation reservation) =>
      ReservationModel(
          name: reservation.name,
          court: reservation.court,
          date: reservation.date);

  Reservation toEntity() => Reservation(name: name, court: court, date: date);
}
