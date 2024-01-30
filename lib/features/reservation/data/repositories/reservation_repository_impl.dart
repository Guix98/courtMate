import 'package:court_mate/core/error/failures.dart';
import 'package:court_mate/features/reservation/data/datasources/local/reservation_datasouce.dart';
import 'package:court_mate/features/reservation/data/models/reservation_model.dart';
import 'package:court_mate/features/reservation/domain/entities/reservation.dart';
import 'package:court_mate/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:dartz/dartz.dart';

class ReservationRespositoryImpl implements ReservationRespository {
  final ReservationDataSource dataSource;

  ReservationRespositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, List<Reservation>>> getReservations() async {
    try {
      final reservationModels = dataSource.getReservations();
      List<Reservation> reservations =
          reservationModels.map((model) => model.toEntity()).toList();

      return Right(reservations);
    } catch (e) {
      return Left(SomeSpecificError(e.toString()));
    }
  }

  @override
  Future<void> addReservation(Reservation reservation) async {
    final reservationModel = ReservationModel.fromEntity(reservation);
    dataSource.addReservation(reservationModel);
  }

  @override
  Future<void> deleteReservation(int id) async {
    dataSource.deleteReservation(id);
  }
}
