import 'package:court_mate/features/reservation/domain/entities/reservation.dart';
import 'package:hive/hive.dart';

part 'reservation_model.g.dart';

@HiveType(typeId: 0)
class ReservationModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String court;
  @HiveField(3)
  final DateTime date;

  ReservationModel(
      {required this.id,
      required this.name,
      required this.court,
      required this.date});

  factory ReservationModel.fromEntity(Reservation reservation) =>
      ReservationModel(
          id: reservation.id,
          name: reservation.name,
          court: reservation.court,
          date: reservation.date);

  Reservation toEntity() =>
      Reservation(id: id, name: name, court: court, date: date);
}
