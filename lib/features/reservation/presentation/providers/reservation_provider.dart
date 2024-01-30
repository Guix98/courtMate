import 'package:court_mate/features/reservation/data/datasources/local/reservation_datasouce.dart';
import 'package:court_mate/features/reservation/data/models/reservation_model.dart';
import 'package:court_mate/features/reservation/data/repositories/reservation_repository_impl.dart';
import 'package:court_mate/features/reservation/domain/entities/reservation.dart';
import 'package:court_mate/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:court_mate/features/reservation/domain/usecases/add_reservation.dart';
import 'package:court_mate/features/reservation/domain/usecases/delete_reservation.dart';
import 'package:court_mate/features/reservation/domain/usecases/get_reservations.dart';
import 'package:hive/hive.dart';
import 'package:riverpod/riverpod.dart';

final reservationDataSourceProvider = Provider<ReservationDataSource>((ref) {
  final Box<ReservationModel> reservationBox = Hive.box('reservations');
  return ReservationDataSource(reservationBox: reservationBox);
});

final reservationRespositoryProvider = Provider<ReservationRespository>((ref) {
  final dataSource = ref.read(reservationDataSourceProvider);
  return ReservationRespositoryImpl(dataSource: dataSource);
});

final getReservationsProvider = Provider<GetReservations>((ref) {
  final repository = ref.read(reservationRespositoryProvider);
  return GetReservations(repository: repository);
});

final addReservationProvider = Provider<AddReservation>((ref) {
  final repository = ref.read(reservationRespositoryProvider);
  return AddReservation(repository: repository);
});

final deleteReservationProvider = Provider<DeleteReservation>((ref) {
  final respository = ref.read(reservationRespositoryProvider);
  return DeleteReservation(repository: respository);
});

final reservationsListNotifierProvider =
    StateNotifierProvider<RerservationListNotifier, List<Reservation>>((ref) {
  final getReservations = ref.read(getReservationsProvider);
  final addReservation = ref.read(addReservationProvider);
  final deleteReservation = ref.read(deleteReservationProvider);

  return RerservationListNotifier(
      getReservations, addReservation, deleteReservation);
});

class RerservationListNotifier extends StateNotifier<List<Reservation>> {
  final GetReservations _getReservations;
  final AddReservation _addReservation;
  final DeleteReservation _deleteReservation;

  RerservationListNotifier(
      this._getReservations, this._addReservation, this._deleteReservation)
      : super([]);

  Future<void> getAllReservations() async {
    final reservations = await _getReservations();
    reservations.fold(
        (error) => state = [], (reservations) => state = reservations);
  }

  Future<void> addNewReservation(Reservation reservation) async {
    await _addReservation(reservation);
  }

  Future<void> removeReservation(int reservationId) async {
    await _deleteReservation(reservationId);
  }
}
